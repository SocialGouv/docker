# Wait for PostgreSQL

> Wait for the given PostgreSQL database to be ready and accept connections

## Usage

### Environment variables

| Key               | Value | Usage                          |
| ----------------- | ----- | ------------------------------ |
| WAIT_FOR_RETRIES  | 120   | number of retries              |
| WAIT_FOR_INTERVAL | 5     | wait between retries (seconds) |

As this execute psql, [every psql environment variable](https://www.postgresql.org/docs/9.3/libpq-envars.html) is also accepted

### Example in k8s

```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: migrate-postgresql
  labels:
    app: migrate-postgresql
spec:
  template:
    spec:
      containers:
        - name: migrate-postgresql
          image: knex_or_something
      initContainers:
        - name: wait-for-postgres
          image: ghcr.io/socialgouv/docker/wait-for-postgres

      # OR

      initContainers:
        - name: wait-for-postgres
          image: ghcr.io/socialgouv/docker/wait-for-postgres
          env:
            - name: PGHOST
              value: postgres-postgresql
            - name: WAIT_FOR_INTERVAL
              value: 5s # test every 5s
            - name: WAIT_FOR_RETRIES
              value: 24 # = (2min x 60s) / 5s
```
