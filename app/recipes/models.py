from django.db import models


class Recipe(models.Model):
    """Base model for a recipe."""

    name = models.CharField(max_length=200)
    yummly_id = models.CharField(max_length=1000)
    # text = models.CharField(max_length=1000)
    # link = models.CharField(max_length=200)

    # TODO: add views, likes, maybe comments?
    class Meta:
        db_table = "recipes"
        default_related_name = "recipes"
        # NOTE: possible to implement our own default recipe ordering here
                

class Ingredient(models.Model):
    """Base model for a recipe ingredient."""

    name = models.CharField(max_length=200)
    recipe = models.ManyToManyField("Recipe")

    class Meta:
        db_table = "ingredients"
        default_related_name = "ingredients"


# TODO: add measurement model
#   - should create a relations with recipe_id, ingredient_id, & quantity_id
#   - uncomment below to implement

'''
class Measurment(models.Mod):
    """Base model for ingredient measurement."""

    # tablespoon, liter, ounce, cup, ...
    full_name = models.CharField(max_length=50)

    # mL, tsp, c, ...
    abbreviation = models.CharField(max_length=10)

    # will need to check decimal value to convert to human readable values
    # e.g. *.333 -> 1/3, 0.425 -> 5/8, ...
    quantity = models.DecimalField(max_digits=6,
'''
