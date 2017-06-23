from yummly import Client

# default option values
TIMEOUT = 5.0
RETRIES = 0

client = Client(api_id="98bc9cb0", api_key="8ee53c9ae94336719dfbed1bb6a5c50a",
    timeout=TIMEOUT, retries=RETRIES)

search = client.search('breakfast')
match = search.matches[0]

recipe = client.recipe(match.id)

print(match.recipeName)
