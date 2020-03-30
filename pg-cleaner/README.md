# PostgreSQL Cleaner Image

Use this image in your .gitlab-ci.yml to delete useless PostgreSQL databases when a branch is merged and deleted.

## Environment variables


| Variable               | Description                                                                                                           
| ---------------------- | ----------------------------------------------------------------------
| GITHUB_TOKEN           | Required token to use Github Api                                                        
| CI_PROJECT_PATH        | Environment variable provided by Gitlab CI                                                                               
| PG_PASSWORD            | PostgreSQL password                                                            
| PG_HOST                | PostgreSQL host                                                              
| PG_USER                | PostgreSQL admin user                     
| APP_DATABASE_PREFIX    | Database to delete (list -> Ex : [db1_, db2_])                                                                                      
| HASH_SIZE              | Hash size of your branch name (int)                                                            


