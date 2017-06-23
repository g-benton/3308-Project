#!/usr/bin/python

hostname = '127.0.0.1'
username = 'root'
password = ''
database = 'local-recipe-db'

# Simple routine to run a query on a database and print the results:
def ingredient_print( conn ) :
    cur = conn.cursor()

    cur.execute( "SELECT * FROM ingredients" )

    for name in cur.fetchall() :
        print name

print 'using mysqldb'
import MySQLdb
myConnection = MySQLdb.connect( host=hostname, user=username, passwd=password,
    db=database )
ingredient_print( myConnection )
myConnection.close()
