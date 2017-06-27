from django.shortcuts import render
from django.http import HttpResponse
from recipe.models import Ingredients, Recipes, RecipeIngredients


# from .forms import NameForm

def get_input(request):
    if request.method == 'GET':
        #search_id is what the user inputs
        search_id = request.GET.get('text_input', None) #text_input is from line 42 in html
        if search_id is not None:
            search_id = search_id.split()

    ingredient_key = 14
    ingredient_name = Ingredients.objects.get(id = ingredient_key).name

    return render(request, 'index.html', {'user_input': ingredient_name}) #goes to the html page

    #print "Your input:", search_id --check if input is correct
    return render(request, 'index.html') #goes to the html page
