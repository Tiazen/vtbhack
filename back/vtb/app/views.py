from django.shortcuts import render
from rest_framework.response import Response
from rest_framework import viewsets
from rest_framework.decorators import action

from app.models import *
from app.serializers import *

from rest_framework_simplejwt.serializers import TokenObtainPairSerializer


class AppUserViewSet(viewsets.ModelViewSet):
    queryset = AppUser.objects.all()
    serializer_class = AppUserSerializer


    @action(methods=["POST"], detail=False,)
    def signin(self, request):
        uSer = UserSerializer(data=request.data)
        if uSer.is_valid():
            user = User.objects.create_user(username=uSer.validated_data.get("email"),
                        password=uSer.validated_data.get("password"),
                        first_name=uSer.validated_data.get("first_name"),
                        last_name=uSer.validated_data.get("last_name"))
            user.save()
            appUser = AppUser(user=user, age=uSer.initial_data.get('age'))
            appUser.save()

            token = TokenObtainPairSerializer.get_token(user)
            return Response({"refresh": str(token), "access": str(token.access_token)})
        return Response("Bad request", 400)
    

    @action(methods=["GET"], detail=False)
    def rating(self, request):
        user = int(request.GET.get("id", False))
        if user:
            ratings = AppUser.objects.filter(id=user)
            if ratings.count() == 0:
                return Response("No such user", 404)
        else:
            ratings = AppUser.objects.all()
        
        rSerializer = AppUserRatingsSerializer(ratings, many=True)
        return Response(rSerializer.data)
        

class GameViewSet(viewsets.ModelViewSet):
    serializer_class = GameSerializer

    def list(self, request):
        queryset = Game.objects.filter(status=0)
        serializer = GameSerializer(queryset, many=True)
        if serializer.data:
            return Response(serializer.data)
        return Response("No games. You can create your own")
    
    def create(self, request):
        gSerializer = GameSerializer(data=request.data)
        
        if gSerializer.is_valid():
            if PlayerGames.objects.filter(player__user=request.user, game__status=0).count() == 0:
                game = Game(gameType=gSerializer.validated_data.get('gameType', 0),
                            amountOfPlayers=gSerializer.validated_data.get("amountOfPlayers", 2))
                game.save()
                pg = PlayerGames(game=game, player=AppUser.objects.get(user=request.user))
                pg.save()
                return Response({"status": "OK"}, 200)
            return Response({"status": "Already in game"}, 403)
        return Response("Bad request", 400)
    
    @action(methods=["GET"], detail=False)
    def connect(self, request):
        gameId = int(request.GET.get("id", False))
        if gameId:
            game = Game.objects.filter(id=gameId)
            if game.count() == 1 and PlayerGames.objects.filter(player__user=request.user, game__status=0).count() == 0:
                pg = PlayerGames(game=game[0], player=AppUser.objects.get(user=request.user))
                pg.save()
                return Response({"wsUrl": "ws://127.0.0.1:7777/?game={}/u={}".format(gameId, pg.player.id)})
            return Response({"status": "Invalid id"})
        return Response("Bad request", 400)
    
    @action(methods=["GET"], detail=False)
    def getQuestions(self, request):
        gameId = int(request.GET.get("id", False))
        if Game.objects.filter(id=gameId).count() == 1:
            questions = Question.objects.all()
            return Response(QuestionSerializer(questions, many=True).data)
        return Response({"status": "Not found"}, 404)

    @action(methods=["POST"], detail=False)
    def results(self, request):
        results = request.data.get("results")
        gameId = results.get("id")
        answers = results.get("ans")
        if Game.objects.filter(id=gameId).count() == 1:
            uRatings = []
            for k, v in answers.items():
                rating = 0
                user = AppUser.objects.filter(user__id=k)
                if user.count() == 1:
                    user = user[0]
                    for item in v:
                        q = Question.objects.get(id=item["id"])
                        if item["ans"] == q.nRight:
                            rating += 1
                    uRatings.append((user, rating))
                    user.rating = user.rating + rating
                    user.save()

            game = Game.objects.get(id=gameId)
            game.status = 2
            game.winner = max(uRatings)[0]
            game.save()
            return Response("OK")
        return Response("Bad request")
    
    @action(methods=["GET"], detail=False)
    def delGame(self, request):
        gameId = int(request.GET.get('game'))
        g = Game.objects.get(id=gameId)
        g.status = 2
        g.save()
        return Response("OK")

