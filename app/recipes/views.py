from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404, redirect
from search import ingredient_search_function
from search import views as searchviews

from .models import Ingredient, Recipe
from .forms import SearchForm

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
    return render(request, 'search_form.html') #goes to the html page

    # if request.method == 'POST':
    #     # handle search request
    #     form = SearchForm(request.POST)
    #
    #     if form.is_valid():
    #
    #         # process searching to get pk of first recipe
    #         primary_key = 4
    #
    #         return redirect(str(primary_key) + '/')
    # else:
    #     # get a empty form
    #     form = SearchForm()
    #
    # return render(request, 'search_form.html', {'form': form})



# def index(request):
#     return render(request, 'search_form.html', {'form': })

def recipe_detail(request, pk):
    # recipe = Recipe.objects.get(pk=pk)

    #
    recipe = get_object_or_404(Recipe, pk=pk)
    ingredients = recipe.ingredients.all()

    return render(request, 'recipes/recipe_detail.html', {'recipe': recipe, 'ingredients': ingredients})
