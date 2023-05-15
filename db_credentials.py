#!/usr/bin/env python3

from secrets import secrets
datawarehouse_name = 'NDW'

# target
datawarehouse_db_config = {
    'host': secrets.get('DB_HOST'),
    'user': secrets.get('DB_USER'),
    'password': secrets.get('DB_PWD'),
    'database': '{}'.format(datawarehouse_name),
    'port': 3306,
    # 'driver': '{MySQL}',
    'autocommit': True

}

# source db
mysql_db_config = [
    {
        'user': secrets.get('DB_USER'),
        'password': secrets.get('DB_PWD'),
        'host': secrets.get('DB_HOST'),
        'database': 'OpenEMR'
    },
    {
        'user': secrets.get('DB_USER'),
        'password': secrets.get('DB_PWD'),
        'host': secrets.get('DB_HOST'),
        'database': 'NationalDataWarehouse'
    }
]
