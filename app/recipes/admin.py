from django.contrib import admin

from .models import Recipe, Ingredient

class StepInline(admin.StackedInline):
    model = Ingredient

class CourseAmin(admin.ModelAdmin):
    inlines = [StepInline,]

admin.site.register(Recipe)
admin.site.register(Ingredient)
