from django.shortcuts import render
from django.http import HttpResponse
from recipe.models import Ingredient, Recipe
from search import ingredient_search_function
from search import get_urls
from django.core import serializers
from recipe import views as recipe_views
# from dal import autocomplete
# from .forms import NameForm





def search_recipes(request, search_id):

    ## need to alter the way empty sets are returned.
    recipe_results = ingredient_search_function.search_recipes(search_id)
    if (recipe_results is None):
        # return recipe_views.get_input(request)
        return render(request, 'index.html')
    test = get_urls.get_urls(recipe_results)
    if(request.GET.get('reset')):
        return render(request, 'index.html')

    return render(request, 'base.html', {'data' : test})
    # return render_template('index.html',name=recipe_results)
