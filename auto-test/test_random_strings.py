import time
import csv
import random, string
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException

## need all inputs to be ascii-able
def is_ascii(s):
    return all(ord(c) < 128 for c in s)

def randomword(length):
   return ''.join(random.choice(string.lowercase) for i in range(length))
## read in list of ingredients from stored csv
with open('ingredients.csv', 'rU') as f:
    reader = csv.reader(f)
    ingredients = list(rec[1] for rec in csv.reader(f, delimiter = ','))
    f.close()

random_words = list()
for word in range(20):
    length = random.randint(1, 10)
    random_words.append(randomword(length))

# print(random_words)
#

# get the chrome driver and direct at webpage
driver = webdriver.Chrome('./chromedriver')
driver.get("localhost:8000/recipes/search")

# loop through a few things that will return recipes if sent to yummly
for ingred in random_words:

    # pair with things we already have
    found_match = False
    while(not found_match):
        # try to find an ingredient
        known_ingred = random.choice(ingredients)
        #make sure that it is ascii-safe
        if(is_ascii(known_ingred)):
            found_match = True

    # fill out search form and submit
    element = driver.find_element(By.NAME, "text_input")
    # print(ingred)
    element.send_keys((ingred + " " + known_ingred))
    element.submit()
    try:
        # if a traceback exists we hit an error
        element = driver.find_element(By.ID, "traceback")
        print("failure at input:" + str(ingred))
    except NoSuchElementException:
        # otherwise just head back and keep going
        driver.get("localhost:8000/recipes/search")

print("GOOD")
