###################
# reads in a list of strings
# of ingredients and returns
# a list of matching recipes
###################
## allows for a clean try-catch method to look for database entries
from django.core.exceptions import ObjectDoesNotExist
## import the necessary database models
from recipe.models import Ingredients, Recipes, RecipeIngredients
from types import *

def search_recipes(ingredient_list):

    ingred_id_list = list()

    for ingred in ingredient_list:
        ### if there is more than one ingred the comma gets tacked on
        ### this should probably be dealt with on the front end side
        ingred = ingred.strip(",")
        ## filter results to see if anything comes back
        # returns a queryset
        query_result = Ingredients.objects.filter(name = ingred)
        if (len(query_result) > 0):
            print(query_result[0].id)
            # if there is an ingredient with that name, then include its id.
            ingred_id_list.append(query_result[0].id)


    if (len(ingred_id_list) == 0):
        return None

    recipe_set = RecipeIngredients.objects.filter(ingredient_id__in = ingred_id_list)

    return None
