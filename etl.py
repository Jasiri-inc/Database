import mysql.connector
from sql_queries import *
from db_credentials import *


def etl(query, source_db, target_db):
    """ extract data from source db
    """
    source_cursor = source_db.cursor()
    source_cursor.execute(query.extract_query)
    data = source_cursor.fetchall()
    source_cursor.close()

    if data:
        target_cursor = target_db.cursor()
        target_cursor.execute('USE {}'. format(datawarehouse_name))
        target_cursor.executemany(query.load_query, data)
        print('data loaded to warehouse  db')
        target_cursor.close()
    else:
        print('empty data')


def etl_process(queries, target_db, source_db_config, db_platform):
    if db_platform == 'mysql':
        source_db = mysql.connector.connect(**source_db_config)
    else:
        return 'Error! unrecognised db platform'

    for query in queries:
        etl(query, source_db, target_db)

    source_db.close()
