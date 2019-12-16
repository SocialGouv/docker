# azure-db

> some Azure Postgres commands

## Features

#### `create-db-user`

Creates a new database and a new user on some Azure Postgres Server

| Env               | Desc                   | Example                            |
| ----------------- | ---------------------- | ---------------------------------- |
| POSTGRES_HOST     | PG server host         | `host.postgres.database.azure.com` |
| POSTGRES_PORT     | PG server port         | 5432                               |
| POSTGRES_USER     | PG super user          | `postgres@servername`              |
| POSTGRES_PASSWORD | PG super user password |                                    |
| NEW_DB_NAME       | new database name      |
| NEW_USER          | new user name          | `new-username@servername`          |
| NEW_PASSWORD      | new user password      |

#### `drop-db-user`

Drop a database and a user on some Azure Postgres Server

| Env               | Desc                   | Example                            |
| ----------------- | ---------------------- | ---------------------------------- |
| POSTGRES_HOST     | PG server host         | `host.postgres.database.azure.com` |
| POSTGRES_PORT     | PG server port         | 5432                               |
| POSTGRES_USER     | PG super user          | `postgres@servername`              |
| POSTGRES_PASSWORD | PG super user password |                                    |
| DROP_DATABASE     | database to drop       |
| DROP_USER         | user to drop           | `username@servername`              |

## See Also

- https://docs.microsoft.com/en-us/cli/azure/postgres
