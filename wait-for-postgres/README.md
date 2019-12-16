# Wait for PostgreSQL

> Wait for PostgreSQL to be ready in an image.

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
          image: registry.gitlab.factory.social.gouv.fr/socialgouv/docker/wait-for-postgres:<version>

      # OR

      initContainers:
        - name: wait-for-postgres
          image: registry.gitlab.factory.social.gouv.fr/socialgouv/docker/wait-for-postgres:<version>
          env:
            - name: PGHOST
              value: postgres-postgresql
            - name: WAIT_FOR_INTERVAL
              value: 5s # test every 5s
            - name: WAIT_FOR_RETRIES
              value: 24 # = (2min x 60s) / 5s 
```
