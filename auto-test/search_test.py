import time
import csv
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException

## need all inputs to be ascii-able
def is_ascii(s):
    return all(ord(c) < 128 for c in s)


## read in list of ingredients from stored csv
with open('ingredients.csv', 'rU') as f:
    reader = csv.reader(f)
    ingredients = list(rec[1] for rec in csv.reader(f, delimiter = ','))
    f.close()

# print(ingredients)


# get the chrome driver and direct at webpage
driver = webdriver.Chrome('./chromedriver')
driver.get("localhost:8000/recipes/search")
## extract the search box as "element"
for ingred in ingredients:
    ## all inputs need to be ascii converted
    if(is_ascii(ingred)):
        # fill out search form and submit
        element = driver.find_element(By.NAME, "text_input")
        print(ingred)
        element.send_keys(ingred)
        element.submit()
        try:
            # if a traceback exists we hit an error
            element = driver.find_element(By.ID, "traceback")
            print("failure at input:" + str(ingred))
        except NoSuchElementException:
            # otherwise just head back and keep going
            driver.get("localhost:8000/recipes/search")

print("GOOD")
