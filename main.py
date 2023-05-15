#!/usr/bin/env python3

from db_credentials import *
from sql_queries import *
from etl import etl_process
import mysql.connector


def main():
    print('starting etl')
    target_db = mysql.connector.connect(**datawarehouse_db_config)

    for config in mysql_db_config:
        try:
            print('loading db: ' + config['database'])
            etl_process(mysql_queries, target_db, config, 'mysql')
        except Exception as e:
            print(f'etl for {config["database"]} has error')
            print(f'Error message: {e}')
            continue
    target_db.close()


if __name__ == '__main__':
    main()
