###################
# reads in a list of strings
# of ingredients and returns
# a list of matching recipes
###################
## allows for a clean try-catch method to look for database entries
from django.core.exceptions import ObjectDoesNotExist
from django.db.models import Q
## import the necessary database models
from recipe.models import Ingredient, Recipe, Recipe
import requests
## import database functions to allow db inserts
# from search.database_call_functions import insert_ingredient, insert_recipe
# from search.database_call_functions import insert_recipe_ingredient


####################
# Set up API calls
####################
# constants for API calls
APP_ID = "98bc9cb0"
APP_KEY = "8ee53c9ae94336719dfbed1bb6a5c50a"

# base url for api calls
BASE_URL = ("http://api.yummly.com/v1/api/recipes?_app_id=" +
    APP_ID + "&_app_key=" + APP_KEY + "&q=")

def search_recipes(ingredient_list):
    ### pre processing ###

    # list that will store id's of input recipes
    input_id_list = list()
    # list that will contain the recipe and ingredients to return
    return_list = list()
    # list of yummly id's so that things don't get double entered.
    found_recipes = list()

    # NEED A LIST OF INGREDIENT ID'S!
    for ingred in ingredient_list:
        ### if there is more than one ingred the comma gets tacked on
        ### this should probably be dealt with on the front end side
        ingred = ingred.strip(",")
        ## filter results to see if anything comes back
        # returns a queryset
        query_result = Ingredient.objects.filter(name__contains = ingred)
        # ob_list = data.objects.filter(reduce(lambda x, y: x | y,\
        #     [Q(name__contains=word) for word in list]))
        if (len(query_result) > 0):
            # print(query_result[0].id)
            # if there is an ingredient with that name, then include its id.
            input_id_list.append(query_result[0].id)
        else:
            ############################
            # If the ingredient isn't found
            # we can find and insert a recipe containing it
            ############################
            # print(BASE_URL + str(ingred))
            yumm_data = requests.get(BASE_URL + str(ingred)).json()
            # print(yumm_data)
            if (len(yumm_data['matches']) > 0):
                first_recipe = yumm_data['matches'][0]

                # parse out information
                rec_name = first_recipe['recipeName'].encode('utf-8')
                if( not Recipe.objects.filter(name  = rec_name).exists()):
                    # Now we'll need the yummly id for insertion
                    yumm_id = first_recipe['id']
                    # create a recipe entry and save it
                    rec_entry = Recipe.objects.create(name = rec_name, yummly_id = yumm_id)
                    rec_entry.save() # dont want to do this yet!
                    # now get and enter all ingredients and store those
                    # print("NEW RECIPE:   " + str(rec_entry))
                    rec_ingreds = first_recipe['ingredients']
                    # print("WITH INGREDIENTS:   " + str(rec_ingreds))
                    for rec_ingred in rec_ingreds:
                        if not Ingredient.objects.filter(name = rec_ingred).exists():
                            rec_entry.ingredient_set.create(name = rec_ingred)
                        else:
                            ingred_entry = Ingredient.objects.get(name = rec_ingred)
                            rec_entry.ingredient_set.add(ingred_entry)



            ## now attempt to append
            ingred_query = Ingredient.objects.filter(name = ingred)
            if (len(ingred_query) > 0):
                # print("HERHERHEHREHREHHERHERHEHREHRHE")
                input_id_list.append(ingred_query[0].id)


    #### THE CANCEL OPTION IF THE USER JUST HITS ENTER OR ONLY ENTERS GARBAGEfdjslkjfldas
    if (len(input_id_list) == 0):
        return None

    ## query for all recipes that use ANY of those ingredients
    recipe_query = Recipe.objects.filter(ingredient__in = input_id_list)

    # iterate through the queryset of recipes
    for recipe in recipe_query:

        # get # of recipe ingreds, owned ingreds, and missing ingreds
        recipe_ingreds = Ingredient.objects.filter(recipe = recipe.id)\
            .values_list('id', flat = True)

        total_ingred = len(recipe_ingreds)
        ingred_have = len( set(input_id_list) & set(recipe_ingreds) )
        ## missing ingredient count
        missing_ingred = total_ingred - ingred_have
        # if (not recipe.yummly_id in return_list[:][0]):
            ## return a tuple of yummly_ids and no. of missing  ingreds
        if(not recipe.yummly_id in found_recipes):
            return_list.append([recipe.yummly_id, missing_ingred])
            found_recipes.append(recipe.yummly_id)

    # sort the list based on missing ingreds,
    #   so that closest matches come up first
    return_list.sort(key=lambda x: x[1])

    # extract all of the yummly ids
    rtn = [item[0] for item in return_list]

    ## return list of yummly_ids
    return (return_list)
