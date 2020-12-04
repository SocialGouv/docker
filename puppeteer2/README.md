# Puppeteer 

> Puppeteer image for e2e tests. Made to run e2e test on gitlab.

### Example for codecept

```yaml
E2E Test @optional/e2e.runner.puppeteer:
  stage: Code Quality
  image: registry.gitlab.factory.social.gouv.fr/socialgouv/docker/puppeteer:<version>
  variables:
    CODECEPT_BASEURL: "http://mywebsite.dev.factory.social.gouv.fr"
  artifacts:
    expire_in: 1 week
    when: always
    paths:
      - optional/e2e/puppeteer/output
  cache:
    key: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
    paths:
      - optional/e2e/.runners/puppeteer/node_modules
      - $CI_PROJECT_DIR/.yarn
  before_script:
    - cd ./optional/e2e/.runners/puppeteer
  script:
    - yarn config set cache-folder $CI_PROJECT_DIR/.yarn
    - yarn --frozen-lockfile
    - yarn test
```
