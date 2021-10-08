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
        print(user)
        if user:
            ratings = AppUser.objects.filter(id=user)
            if ratings.count() == 0:
                return Response("No such user", 404)
        else:
            ratings = AppUser.objects.all()
        
        rSerializer = AppUserRatingsSerializer(ratings, many=True)
        return Response(rSerializer.data)
        



    
