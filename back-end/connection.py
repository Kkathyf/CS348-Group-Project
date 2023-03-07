import mysql.connector

# connect follows SELECT * FROM Movie format
def connect(searchTerm):
    try:
        # establish connection
        cnx = mysql.connector.connect(user='user1',
                                      password='Password0!',
                                      host='localhost',
                                      database='CS348_MOVIE_DB')

        # create a cursor
        cursor = cnx.cursor()

        sql_query = 'SELECT *  FROM Movie ' + searchTerm

        # execute the SQL script
        cursor.execute(sql_query)
        data = cursor.fetchall()
        cursor.close()
        cnx.close()
        return data

        # close cursor and connection
    except Exception as e:
        # handle the exception
        print("An error occurred: ", e)


# connects uses complete SQL statement
def connects(statement):
    try:
        # establish connection
        cnx = mysql.connector.connect(user='user1',
                                      password='Password0!',
                                      host='localhost',
                                      database='CS348_MOVIE_DB')

        # create a cursor
        cursor = cnx.cursor()

        # execute the SQL script
        cursor.execute(statement)
        data = cursor.fetchall()
        cursor.close()
        cnx.close()
        return data

        # close cursor and connection
    except Exception as e:
        # handle the exception
        print("An error occurred: ", e)
