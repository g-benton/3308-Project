from django.shortcuts import render
from django.http import HttpResponse

from recipes.models import Recipe


def show_all_recipes(request):
    return HttpResponse("Show all recipes here!")

def show_single(request):
    return HttpResponse("Your looking at a single recipe now.")