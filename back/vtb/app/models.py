from django.db import models

from django.contrib.auth.models import User


class AppUser(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    rating = models.FloatField(default=0)
    amountOfGames = models.IntegerField(default=0)
    level = models.IntegerField(default=1)
    age = models.IntegerField(default=0)


class Game(models.Model):
    # Status 0 - Waiting for players, 1 - On going, 2 - finished
    gameType = models.IntegerField(default=0)
    created_at = models.DateTimeField(auto_now=True)
    status = models.IntegerField(default=0)
    winner = models.ForeignKey(AppUser, on_delete=models.CASCADE, blank=True, null=True, default=None)
    amountOfPlayers = models.IntegerField(default=2)
    amountOfQuestions = models.IntegerField(default=10)

class PlayerGames(models.Model):
    game = models.ForeignKey(Game, on_delete=models.CASCADE)
    player = models.ForeignKey(AppUser, on_delete=models.CASCADE)


class Question(models.Model):
    question = models.CharField(max_length=2000)
    qtype = models.IntegerField(default=0)
    a1 = models.CharField(max_length=2000)
    a2 = models.CharField(max_length=2000)
    a3 = models.CharField(max_length=2000, default=None)
    a4 = models.CharField(max_length=2000, default=None)
    nRight = models.IntegerField(default=1)