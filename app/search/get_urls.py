########################
# take yummly ids and return urls
## CAN BE EXTENDED TO RETURN ANYTHING, JUST NEED URLS FOR NOW!
########################
from django.core.exceptions import ObjectDoesNotExist
## import the necessary database models
from recipe.models import Ingredient, Recipe
import requests
from types import *

# constants for API calls
APP_ID = "98bc9cb0"
APP_KEY = "8ee53c9ae94336719dfbed1bb6a5c50a"

# Strings needed to make requests
BASE_URL = "http://api.yummly.com/v1/api/recipe/"
END_URL = ("?_app_id=" + APP_ID + "&_app_key=" + APP_KEY)

def get_urls(recipe_list):

    ## list that will be returned.
    ##  each element is going to be a recipe.
    return_data = list()

    rtn_index = 0
    for recipe in recipe_list:
        return_data.append(list())
        # make api call and convert to json
        yumm_data = requests.get(BASE_URL + str(recipe) + END_URL)
        yumm_data = yumm_data.json()

        # enter data from json
        return_data[rtn_index].append(yumm_data['name'])
        return_data[rtn_index].append(yumm_data['attribution']['url'])

        ### THIS ISN'T WORKING
        # images.append(yumm_data['images']['hostedSmallUrl'])
        rtn_index += 1

    ## only returning names and urls, waiting to get images to run.
    return (return_data)
