def item_found( conn ,table,  name) :
    # encode name correctly
    name = name.encode('utf-8')
    name = name.replace("'", '')
    call = "SELECT name FROM %s WHERE( name = '%s');" % ( table, name)
    print(call)
    # generate cursor and execute
    cur = conn.cursor()
    cur.execute(call)

    # return the length of the matches, if 0 then the ingredient isnt in table
    # cur.close()
    return (len(cur.fetchall()))

def get_id(conn, table, name):
    # encode name correctly
    name = name.encode('utf-8')
    name = name.replace("'", '')
    # cursor and execution
    cur = conn.cursor()
    cur.execute("SELECT id FROM %s WHERE( name = '%s' );" % (table, name))
    # return the full db fetch

    # cur.close()
    return (cur.fetchone()[0])

def insert_ingredient(conn, name):
    # encode name correctly
    name = name.encode('utf-8')
    name = name.replace("'", '')

    # pretty strightforward sqwl instructions
    cur = conn.cursor()
    cur.execute("INSERT INTO ingredients(name) VALUES('%s');" % name)
    cur.close()
    return None

def insert_recipe(conn, recipe):
    # parse out the recipe info and encode correctly
    name = recipe.recipeName.encode('utf-8')
    yummly_id = recipe.id.encode('utf-8')
    name = name.replace("'", '')
    yummly_id = yummly_id.replace("'", '')

    # name = recipe.recipeName
    # yummly_id = recipe.id
    # call = ("INSERT INTO recipes(name, yummly_id) "
    #     "VALUES('%s', '%s');" % (name, yummly_id))
    # print(call)
    # cursor and execution
    cur = conn.cursor()
    cur.execute(("INSERT INTO recipes(name, yummly_id) "
        "VALUES('%s', '%s');" % (name, yummly_id)))

    # cur.close()
    return None


def insert_recipe_ingredient(conn, recipe_id, ingredient_id):
    # pretty strightforward sql instructions
    cur = conn.cursor()
    cur.execute( ("INSERT INTO recipe_ingredients(recipe_id, ingredient_id)"
        " VALUES('%s', '%s');" % (recipe_id, ingredient_id)) )

    # cur.close()
    return None
