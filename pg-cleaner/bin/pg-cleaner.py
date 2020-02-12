import hashlib
import os
import json
import psycopg2
from urllib import request
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

github_token = os.environ["GITHUB_TOKEN"]
ci_project_path = os.environ["CI_PROJECT_PATH"]
pg_password = os.environ["PG_PASSWORD"]
pg_host = os.environ["PG_HOST"]
pg_user = os.environ["PG_USER"]
app_database_prefix_list = os.environ["APP_DATABASE_PREFIX"]
hash_size = int(os.environ["HASH_SIZE"])

def get_active_hash_branch_list_from_github():
  url = "https://api.github.com/repos/" + ci_project_path + "/branches".format(github_token)
  req = request.Request(url, None, {"token": github_token})
  response = request.urlopen(req)
  branch_json = json.loads(response.read())

  return [
    hashlib.sha1(branch["name"].encode()).hexdigest()[:hash_size]
    for branch in branch_json
  ]

def get_database_list_to_delete(active_database_name_list, database_name_from_active_branch_list):
  database_not_linked_to_branch_list = []

  for active_database_name in active_database_name_list:
    if active_database_name not in database_name_from_active_branch_list:
      database_not_linked_to_branch_list.append(active_database_name)

  return database_not_linked_to_branch_list


def delete_database_not_linked_to_branch(active_hash_branch_list):

  if active_hash_branch_list:
    database_name_from_active_branch_list = []

    for app_database_prefix in app_database_prefix_list.split(','):
      try:
        for active_hash_branch in active_hash_branch_list:
          database_name_from_active_branch_list.append(app_database_prefix+active_hash_branch)

        print('Connecting to the PostgreSQL database...')
        connection = psycopg2.connect(host=pg_host,database="postgres", user=pg_user, password=pg_password)
        connection.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
        cursor = connection.cursor()

        print('Fetch databases starting with: '+ app_database_prefix)
        cursor.execute("SELECT datname FROM pg_database WHERE datname LIKE \'" + app_database_prefix + "%\';")
        active_database_list = cursor.fetchall()

        if active_database_list:
          active_database_name_list=[]
          for database in active_database_list:
            active_database_name_list.append(database[0])
            print(database[0])
            print('-------------------------------------')
          for database_to_delete in get_database_list_to_delete(active_database_name_list, database_name_from_active_branch_list):
            cursor.execute("DROP DATABASE IF EXISTS "+ database_to_delete + ";")
            print('Database deleted: ' + database_to_delete)

        cursor.close()
        print('-------------------------------------')
      except (Exception, psycopg2.DatabaseError) as error:
        print(error)
      finally:
        if connection is not None:
          connection.close()
          print('Database connection closed.')
          print('-------------------------------------')

if __name__ == '__main__':
  active_hash_branch_list = get_active_hash_branch_list_from_github()
  print('Active Hash Branch List:')
  for active_hash_branch in active_hash_branch_list:
    print(active_hash_branch)
  print('-------------------------------------')

  delete_database_not_linked_to_branch(active_hash_branch_list)

