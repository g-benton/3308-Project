from django.conf.urls import url

from . import views

urlpatterns = [
    # /recipes/
    url(r'^$', views.show_all_recipes),
    # /recipes/[recipe_id]
    # url(r'')
]