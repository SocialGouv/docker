# Infra image that contains ansible and terraform for gitlab-ci Jobs

> Contains all tools (ansible, terraform) required to build infra with gitlab-ci and specific dependencies (azure for i.e)

## Usage 

### Gitlab

```yaml
provision_stack:
  stage: provision
  image:
    name: registry.gitlab.factory.social.gouv.fr/socialgouv/docker/infra-ansible-ci:<version>
  environment:
    name: branch/$CI_COMMIT_REF_NAME
    on_stop: unprovision_stack
  only:
    - master
  except:
    variables:
      - $STACK_NAME == ""
  script:
    - terraform --version
    - terraform env select "$CI_COMMIT_REF_NAME" || terraform env new "$CI_COMMIT_REF_NAME"
    - terraform env list
    - ansible-playbook -i inventories/azure/${STACK_NAME}.azure_rm.yml 00_terraform.yml -e stack_prefix=${STACK_NAME} -e "code_version=${CI_COMMIT_REF_NAME}"  -e gitlab_ci_run=true

```
