# 3308-Project
Repository for team project, CSCI 3308


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
