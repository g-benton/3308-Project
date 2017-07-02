from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404
from search import ingredient_search_function
from search import views as searchviews

from .models import Ingredient, Recipe

# from django.core import serializers
# from dal import autocomplete
# from .forms import NameForm

def welcome(request):
    return render(request, 'welcome.html')

def search(request):

    if request.method == 'GET':
        #search_id is what the user inputs
        ingred_names = request.GET.get('text_input', None) #text_input is from line 42 in html
        if ingred_names is not None:
            ingred_names = ingred_names.split()
            if (len(ingred_names) > 0):
                return searchviews.search_recipes(request, ingred_names)


            # return render(request, 'index.html')


    #print "Your input:", search_id --check if input is correct
    return render(request, 'index.html') #goes to the html page


def index(request):
    return render(request, 'input_form.html')

def recipe_detail(request, pk):
    # recipe = Recipe.objects.get(pk=pk)
    
    # 
    recipe = get_object_or_404(Recipe, pk=pk)
    return render(request, 'recipes/recipe_detail.html', {'recipe': recipe})