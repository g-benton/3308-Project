###################
# reads in a list of strings
# of ingredients and returns
# a list of matching recipes
###################
## allows for a clean try-catch method to look for database entries
from django.core.exceptions import ObjectDoesNotExist
## import the necessary database models
from recipe.models import Ingredient, Recipe
from types import *

def search_recipes(ingredient_list):

    # list that will store id's of input recipes
    input_id_list = list()
    # list that will contain the recipe and ingredients to return
    return_list = list()

    # NEED A LIST OF INGREDIENT ID'S!
    for ingred in ingredient_list:
        ### if there is more than one ingred the comma gets tacked on
        ### this should probably be dealt with on the front end side
        ingred = ingred.strip(",")
        ## filter results to see if anything comes back
        # returns a queryset
        query_result = Ingredient.objects.filter(name = ingred)
        if (len(query_result) > 0):
            # print(query_result[0].id)
            # if there is an ingredient with that name, then include its id.
            input_id_list.append(query_result[0].id)


    #### THE CANCEL OPTION IF THE USER JUST HITS ENTER OR ONLY ENTERS GARBAGEfdjslkjfldas
    if (len(input_id_list) == 0):
        return None

    ## query for all recipes that use ANY of those ingredients
    recipe_query = Recipe.objects.filter(ingredient__in = input_id_list)


    for recipe in recipe_query:
        recipe_ingreds = Ingredient.objects.filter(recipe = recipe.id)\
            .values_list('id', flat = True)
        total_ingred = len(recipe_ingreds)
        ingred_have = len( set(input_id_list) & set(recipe_ingreds) )

        missing_ingred = total_ingred - ingred_have

        return_list.append([recipe.yummly_id, missing_ingred])


    print (return_list)


    # ## get the ingredients associated with the top single recipe
    # top_ingreds = Ingredient.objects.filter(recipe = recipe_query[0].id)
    #
    # for ingred in top_ingreds:
    #     return_ingred_list.append(ingred.name)

    # print(return_ingred_list)

    return ("butts")
