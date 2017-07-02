from django.conf.urls import include, url
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

from . import views

admin.autodiscover()

# Examples:
# url(r'^$', 'gettingstarted.views.home', name='home'),
# url(r'^blog/', include('blog.urls')),

urlpatterns = [
    url(r'^$', views.home),
    url(r'^admin/', include(admin.site.urls)),
    # url(r'^search/', include('search.urls')),
    url(r'^recipes/', include('recipes.urls'))
]

urlpatterns += staticfiles_urlpatterns()
