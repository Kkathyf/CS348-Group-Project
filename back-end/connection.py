import mysql.connector


def connect():
    try:
        # establish connection
        cnx = mysql.connector.connect(user='root',
                                      password='12345678',
                                      host='localhost',
                                      database='CS348_MOVIE_DB')

        # create a cursor
        cursor = cnx.cursor()

        with open('../sample-data.sql', 'r') as file:
            sql_data = file.read()

        with open('../test-sample.sql', 'r') as file:
            sql_test = file.read()


        # execute the SQL script
        for result in cursor.execute(sql_data, multi=True):
            if result.with_rows:
                rows = result.fetchall()
                print(rows)

        for result in cursor.execute(sql_test, multi=True):
            if result.with_rows:
                rows = result.fetchall()
                print(rows)

        # commit changes and close connection
        cnx.commit()

        # close cursor and connection
        cursor.close()
        cnx.close()
    except Exception as e:
        # handle the exception
        print("An error occurred: ", e)
