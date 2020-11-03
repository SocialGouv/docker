# azure-db

> some Azure Postgres commands

## Features

#### `create-db-user`

Creates a new database and a new user on some Azure Postgres Server

| Env               | Desc                              | Example                            |
| ----------------- | --------------------------------- | ---------------------------------- |
| PGHOST            | PG server host                    | `host.postgres.database.azure.com` |
| PGPORT            | PG server port                    | 5432                               |
| PGUSER            | PG super user                     | `postgres@servername`              |
| PGPASSWORD        | PG super user password            |                                    |
| NEW_DB_NAME       | new database name                 |                                    |
| NEW_USER          | new user name                     | `new-username@servername`          |
| NEW_PASSWORD      | new user password                 |                                    |
| NEW_DB_EXTENSIONS | extensions to add to the database | `pgcrypto`                         |

##### Example

```sh
docker run --rm \
  -e PGHOST=server.pg.com \
  -e PGUSER=xxx \
  -e PGPASSWORD=xxx \
  -e NEW_DB_NAME=xxx \
  -e NEW_USER=xxx \
  -e NEW_PASSWORD=xxx \
  # optional
  -e NEW_DB_EXTENSIONS=pgcrypto \
  registry.gitlab.factory.social.gouv.fr/socialgouv/docker/azure-db:0.24.0 create-db-user
```

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

#### `drop-dbs`

Drop all generated databases (`db_*` and `autodevops_*`)

| Env        | Desc                   | Example                            |
| ---------- | ---------------------- | ---------------------------------- |
| PGHOST     | PG server host         | `host.postgres.database.azure.com` |
| PGPORT     | PG server port         | 5432                               |
| PGUSER     | PG super user          | `postgres@servername`              |
| PGPASSWORD | PG super user password |                                    |

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

#### `export_from_k8s_secret`

Convert json k8s secret to bash exports

```bash
# Use case
$ kubectl get secret my-secret -n my-ns -o json | export_from_k8s_secret
export XXX="value"

$ cat <<EOF | export_from_k8s_secret
{ "data": { "FOO": "Zm9vIHZhbHVl" } }
EOF
export FOO="foo value"
```

## See Also

- https://docs.microsoft.com/en-us/cli/azure/postgres
