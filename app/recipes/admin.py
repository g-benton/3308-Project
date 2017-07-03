from django.contrib import admin

from .models import Recipe, Ingredient

class IngredientInline(admin.StackedInline):
    model = Ingredient

class RecipeAmin(admin.ModelAdmin):
    inlines = [IngredientInline,]

admin.site.register(Recipe)
admin.site.register(Ingredient)
