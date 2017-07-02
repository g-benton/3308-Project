from django.conf.urls import url

from . import views

urlpatterns = [
    # /recipes/
    url(r'^$', views.index),
    # meant to handle searching, will return a redirect to 'results'
    # /recipes/search/
    # url(r'^search$', views.search),
    # recipes/[id] - will handle displaying individual recipes
    url(r'^(?P<recipe_id>[0-9]+)/$', views.display_recipe),
]
