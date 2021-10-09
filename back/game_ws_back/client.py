import asyncio
import logging
import websockets

logging.basicConfig(level=logging.INFO)

async def consumer_handler(websocket):
    async for message in websocket:
        log_message(message)

async def produce(ip, port):
    async with websockets.connect(f"ws://{ip}:{port}") as ws:
        msg = input("Сообщение:")
        await ws.send(msg)
        await ws.recv()

def log_message(msg):
    logging.info(f'Message: {msg}')

if __name__ == "__main__":
    loop = asyncio.get_event_loop()
    loop.run_until_complete(produce("127.0.0.1", 4000))
    loop.run_forever()

