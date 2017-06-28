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
            total_results = ingredient_search_function.search_recipes(search_id)
            top_result = total_results[0]
            #goes to the html page
            #
            # s = "http://api.yummly.com/v1/api/recipe/{}?app_id=YOUR_ID&_app_key=YOUR_APP_KEY".format(top_result)
            # response = urllib2.urlopen(s)
            # print (response)


            return render(request, 'index.html', {'user_input': top_result})


    #print "Your input:", search_id --check if input is correct
    return render(request, 'index.html') #goes to the html page
