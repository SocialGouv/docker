# Contributing to SocialGouv/docker 

## Create a new image

1. Create a folder with the image name (example: foo)

```bash
$ mkdir foo
```

1. Add a `README.md`  
   Ensure to add a documentation right from the start with a `README.md`.  
   You can follow the [`k8s-ns-killer/README.md` as model](./k8s-ns-killer/README.md).

1. Add the image to the table in the [root `README.md`](./README.md).  
   Keep alpha sorted plz ;)

1. Add a `.gitlab-ci.yml` to specify the image tests  
   Ensure to add a test right from the start with in a local `.gitlab-ci.yml`.  
   You can follow the [`kubectl/.gitlab-ci.yml` as model](./kubectl/.gitlab-ci.yml).
