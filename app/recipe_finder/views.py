from django.shortcuts import render
# from recipe import views as recipeViews
# def home(request):
#     return recipeViews.search(request)
def home(request):
    return render(request, 'welcome.html')
