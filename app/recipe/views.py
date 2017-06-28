from django.shortcuts import render
from django.http import HttpResponse
from recipe.models import Ingredient, Recipe
# from search_recipes import search_recipes
# import search_recipes
from search import ingredient_search_function

# from .forms import NameForm

def get_input(request):
    if request.method == 'GET':
        #search_id is what the user inputs
        search_id = request.GET.get('text_input', None) #text_input is from line 42 in html
        if search_id is not None:
            search_id = search_id.split()
            ## call from
            top_result = ingredient_search_function.search_recipes(search_id)
            print(top_result)
            #goes to the html page
            return render(request, 'index.html', {'user_input': top_result})
    #
    # ingredient_key = 14
    # ingredient_name = Ingredient.objects.get(id = ingredient_key).name



    #print "Your input:", search_id --check if input is correct
    return render(request, 'index.html') #goes to the html page
