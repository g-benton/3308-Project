from django.conf.urls import url

from . import views

urlpatterns = [
    # meant to handle searching, will return a redirect to 'results'
    # /recipes/search/
    url(r'^search$', views.search, name='search_form'),

    # recipes/[id] - will handle displaying individual recipes
    url(r'^(?P<pk>\d+)', views.recipe_detail, name='single_recipe'),
]
