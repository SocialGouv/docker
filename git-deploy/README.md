# Git Deployments API Scripts

> GitLab/GitHub Deployments API Scripts to dispatch deployment events to GitHub API.
> see https://developer.github.com/v3/repos/deployments/

## Commands

### [create-deployment](./bin/create-deployment)

> Create a new GitHub deployment environment from GitLab `CI_*` variables

```sh
$ create-deployment
```

#### Configuration

| Variable               | Description                                                                                                           | Default                      |
| ---------------------- | --------------------------------------------------------------------------------------------------------------------- | ---------------------------- |
| CI_COMMIT_TAG          | The commit tag name. Present only when building tags. (Gitlab)                                                        | `""`                         |
| CACHE_RESPONSE         | Path where to cache GitHub Api response                                                                               | `"/tmp/deploy_payload.json"` |
| COMMIT_TAG             | The commit tag name.                                                                                                  | `$CI_COMMIT_TAG`             |
| ENVIRONMENT            | The name of the environment that was deployed to                                                                      | `"staging"`                  |
| PRODUCTION_ENVIRONMENT | Specifies if the given environment is one that end-users directly interact with                                       | `false`                      |
| PROJECT_PATH           | The namespace with project name                                                                                       | `$CI_PROJECT_PATH`           |
| REF                    | The ref to deploy. This can be a branch, tag, or SHA.                                                                 | `$CI_COMMIT_REF_NAME`        |
| TRANSIENT_ENVIRONMENT  | Specifies if the given environment is specific to the deployment and will no longer exist at some point in the future | `true`                       |

### [extract-deploy-id](./bin/extract-deploy-id)

> Get the GitHub environment id

```sh
$ extract-deploy-id
```

#### Configuration

| Variable       | Description                                      | Default                      |
| -------------- | ------------------------------------------------ | ---------------------------- |
| CACHE_RESPONSE | Path where to find the cache GitHub Api response | `"/tmp/deploy_payload.json"` |
| DEPLOY_ID_FILE | Path where to cache the extracted deployment id  | `"DEPLOY_ID"`                |

### [update-deployment](./bin/update-deployment)

> Update some GitHub environment status

```sh
$ update-deployment <github_deployment_id> <url> <success|failure>
# with
# github_deployment_id - the  id to update
# url - the url to display as deployment (or not)
# state - the deployment state. Must be : 'success' or 'failure'

# Common example
$ update-deployment $(cat DEPLOY_ID) "${FRONTEND_URL}" failure
# or
$ update-deployment $(cat DEPLOY_ID) "${FRONTEND_URL}" success
```

#### Configuration

| Variable     | Description                                      | Default            |
| ------------ | ------------------------------------------------ | ------------------ |
| ENVIRONMENT  | The name of the environment that was deployed to | `"staging"`        |
| PROJECT_PATH | The namespace with project name                  | `$CI_PROJECT_PATH` |
