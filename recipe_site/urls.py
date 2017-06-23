from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'^recipe_finder/', include('recipe_finder.urls')),
    url(r'^admin/', admin.site.urls),
]
