# azure-db

> some Azure Postgres commands

## Features

#### `create-db-user`

Creates a new database and a new user on some Azure Postgres Server

| Env          | Desc                   | Example                            |
| ------------ | ---------------------- | ---------------------------------- |
| PGHOST       | PG server host         | `host.postgres.database.azure.com` |
| PGPORT       | PG server port         | 5432                               |
| PGUSER       | PG super user          | `postgres@servername`              |
| PGPASSWORD   | PG super user password |                                    |
| NEW_DB_NAME  | new database name      |
| NEW_USER     | new user name          | `new-username@servername`          |
| NEW_PASSWORD | new user password      |

#### `drop-db-user`

Drop a database and a user on some Azure Postgres Server

| Env           | Desc                   | Example                            |
| ------------- | ---------------------- | ---------------------------------- |
| PGHOST        | PG server host         | `host.postgres.database.azure.com` |
| PGPORT        | PG server port         | 5432                               |
| PGUSER        | PG super user          | `postgres@servername`              |
| PGPASSWORD    | PG super user password |                                    |
| DROP_DATABASE | database to drop       |
| DROP_USER     | user to drop           | `username@servername`              |

#### `backup`

Backup a database and store it to some Azure blob

| Env                  | Desc                         | Example                            |
| -------------------- | ---------------------------- | ---------------------------------- |
| PGHOST               | PG server host               | `host.postgres.database.azure.com` |
| PGPORT               | PG server port               | 5432                               |
| PGUSER               | PG super user                | `postgres@servername`              |
| PGPASSWORD           | PG super user password       |                                    |
| PGDATABASE           | PG database to backup        | `postgres`                         |
| STORAGE_ACCOUNT_NAME | Azure storage account name   | `backups`                          |
| STORAGE_ACCOUNT_KEY  | Azure storage account key    |                                    |
| STORAGE_CONTAINER    | Azure storage container name | `backups-app`                      |

## See Also

- https://docs.microsoft.com/en-us/cli/azure/postgres
