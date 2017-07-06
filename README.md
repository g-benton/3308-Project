# 3308-Project
Repository for team project, CSCI 3308

Website name:  Graze <br />
Hosted by Heroku at : [Graze Website Link](https://h-django.herokuapp.com/recipes/search) <br />
Recipe Database:  [Yummly API Link](https://developer.yummly.com/) <br />
Website Instructions:  In order to find recipes that contain your specific ingredients, enter and submit the ingredients <br /> into the search box.  The next page will contain an image of the first matching recipe, along "Yes" and "No" buttons <br />
that correspond to two final actions.  Clicking the "Yes" button will take you to the Yummly page for that recipe. <br />
This page will contain instructions for this recipe, as well as other information about that recipe and similar <br />
recipes. Clicking the "No" button will display the the next matching recipe from your search.  Additional clicks of <br />
the "No" button will continue to individually display matching recipes until all of the matches have been reached. <br />
The final page will not contain any recipe image.  Instead, you may return to the first page to perform a new search <br />
with an empty search box by clicking "New Search". The "Add More Ingredients" button will take you back to the <br />
first page to add ingredients to your initial search. <br />


## Description
A Django built website that allows users to input ingredients and retrieve recipes using a constructed database and the Yummly API. Constructed with a MySQL database, Django, and built inside Docker containers.

## Requirements
Docker/Docker-Compose

Python 3.5+

Django 1.8+

MySQL

Yummly API account

## Build Instructions
Clone repository

Edit app/search/get_urls.py, app/search/ingredient_search_function.py, and files in populate-db-yummly to contain your Yummly API key and i.d.

Docker-Compose up --build

Point browser to localhost:8000
