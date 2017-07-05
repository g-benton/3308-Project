#!/usr/bin/python

###################
# import libraries
###################
# note: if you want to run this both of these will need to be installed.
import MySQLdb
from yummly import Client
from database_call_functions import item_found, get_id
from database_call_functions import insert_ingredient, insert_recipe
from database_call_functions import insert_recipe_ingredient

from types import *
###################
### establish database connection
###################
hostname = '127.0.0.1'
username = 'root'
password = 'root_pw'
database = 'recipe-db'

db_conn = MySQLdb.connect( host=hostname, user=username, passwd=password,
    db=database, use_unicode=True , charset='utf8')
db_conn.autocommit(True)
# cursor to perform queries
# cursor = db_conn.cursor()
######################
# establish yummly connection
#####################

# default option values
TIMEOUT = 5.0
RETRIES = 0

yummly = Client(api_id="98bc9cb0", api_key="8ee53c9ae94336719dfbed1bb6a5c50a",
    timeout=TIMEOUT, retries=RETRIES)

#######################
# main script
#######################

#####################
# wipe database
#####################
main_cursor = db_conn.cursor()
main_cursor.execute("truncate recipes;")
main_cursor.execute("truncate ingredients;")
main_cursor.execute("truncate recipe_ingredients;")


#### list of meals to search through
meal_list = ['breakfast', 'lunch', 'dinner']

# print(item_found(db_conn, "ingredients", "squash"))
for meal in meal_list:
    # search for a meal and get no. of results
    meal_search = yummly.search(meal)
    test = meal_search.matches[0]
    # # iterate through the matches
    for recipe in meal_search.matches:

        # parse out information
        name = recipe.recipeName
        yummly_id = recipe.id
        # print(name)
        # if the item isnt already in the database add it
        if (not item_found(db_conn, "recipes", name)):
            insert_recipe(db_conn, recipe)
            # print("inserted")
            recipe_id = get_id(db_conn, "recipes", name)
            for ingred in recipe.ingredients:
                # if the ingredient is not in the database then add it
                if (not item_found(db_conn, "ingredients", ingred)):
                    insert_ingredient(db_conn, ingred)

                # get the ingredient id from the db
                ingred_id = get_id(db_conn, "ingredients", ingred)
                # print(ingred_id)
                #add the recipe ingredient connection to the database
                insert_recipe_ingredient(db_conn, recipe_id, ingred_id)

        #retrieve the id (used for ingredient insertion)

        # now iterate through the ingredients of the recipe

#######################
# Clean up and close connection
#######################

db_conn.close()
