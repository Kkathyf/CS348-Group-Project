import mysql.connector

def connect():
    # establish connection
    cnx = mysql.connector.connect(user='root',
                                  password='12345678',
                                  host='localhost',
                                  database='test_schema')

    # create a cursor
    cursor = cnx.cursor()

    with open('/Users/clairesheng/CS348-Group-Project/create_tables.sql', 'r') as file:
        sql_script = file.read()

    # execute the SQL script
    for result in cursor.execute(sql_script, multi=True):
        if result.with_rows:
            rows = result.fetchall()
            print(rows)

    # commit changes and close connection
    cnx.commit()

    # close cursor and connection
    cursor.close()
    cnx.close()
