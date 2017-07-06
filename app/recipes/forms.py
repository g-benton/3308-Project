from django import forms

class SearchForm(forms.Form):

    text_input = forms.CharField(label="Enter your ingredients.", widget=forms.TextInput)
