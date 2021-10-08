from rest_framework import serializers
from django.contrib.auth.models import User

from app.models import *

class AppUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = AppUser
        fields = "__all__"


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["first_name", "last_name", "email", "password"]

class UserRatingSerializer(serializers.ModelSerializer):
    class Meta: 
        model = User
        fields = ["first_name", "last_name"]

class AppUserRatingsSerializer(serializers.ModelSerializer):
    user = UserRatingSerializer(read_only=True)
    class Meta:
        model = AppUser
        fields = ["user", "rating", "amountOfGames"]

class GameSerializer(serializers.ModelSerializer):
    class Meta:
        models = Game
        fields = ['gameType', 'status', 'winner']