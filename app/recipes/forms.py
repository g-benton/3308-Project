from django import forms

class SearchForm(forms.Form):

    seach_terms = forms.CharField(label="Enter your ingredients.", widget=forms.TextInput)