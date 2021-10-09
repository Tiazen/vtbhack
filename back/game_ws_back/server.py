import asyncio
import json
import logging
import websockets
import requests

from time import sleep

logging.basicConfig()

class AsyncIterator:
    def __init__(self, seq):
        self.iter = iter(seq)

    def __aiter__(self):
        return self

    async def __anext__(self):
        try:
            return next(self.iter)
        except StopIteration:
            raise StopAsyncIteration

lobbies = {}
answers = {}

def state_event(event):
    return json.dumps({"type": "state", **event})


def user_connect_to_lobby(game):
    return json.dumps({"type": "users", "message": "Connected to the server"})

def user_disconnect_from_lobby(game):
    return json.dumps({"type": "users", "message": "Disconnected from the server"})


async def send_questions(game, questions):
    async for i in AsyncIterator(questions):
        websockets.broadcast(lobbies[game], state_event({"new_question": i}))
        await asyncio.sleep(6)
    websockets.broadcast(lobbies[game], state_event({"game": "finish"}))
    requests.post(f"http://127.0.0.1:8000/game/results/", json={"results": {"id": game,
                                                                        "ans": answers.get(game, {})}})
    answers.pop(game)
    lobbies.pop(game)


def get_questions(game):
    questions = requests.get(f"http://127.0.0.1:8000/game/getQuestions?id={game}")
    return questions.json()

async def serve(websocket, path):
    try:
        print('Connected')
        # Register user
        game = path[path.find("=")+1:path.find("&")]
        user = path[path.rfind("=")+1:]
        lobbies[game] = lobbies.get(game, set())
        lobbies[game].add(websocket)
        websockets.broadcast(lobbies[game], user_connect_to_lobby(game))
        # Manage state changes
        async for message in websocket:
            data = json.loads(message)
            if data["action"] == "start":
                questions = get_questions(game)
                asyncio.gather(send_questions(game, questions))
            elif data["action"] == "answer":
                u_answer = data["answer"]
                answers[game] = answers.get(game, {})
                answers[game][user] = answers[game].get(user, []) + [u_answer]
            
    finally:
        # Unregister user
        lobbies[game].remove(websocket)
        websockets.broadcast(lobbies[game], user_disconnect_from_lobby(game))

async def main():
    async with websockets.serve(serve, "0.0.0.0", 4000):
        await asyncio.Future()  # run forever
        


if __name__ == "__main__":
    asyncio.run(main())