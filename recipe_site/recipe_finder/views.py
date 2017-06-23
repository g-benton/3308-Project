from django.http import HttpResponse


def index(request):
    return HttpResponse("This will become a beautiful website")
