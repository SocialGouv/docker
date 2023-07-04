# check-cluster-images

This image can be used to check that all your running Docker images are still available

- Check that running kubernetes Pods/Jobs/CronJobs images are still available
- Send missing images alert in mattermost

Example usage :

```sh
docker run \
    -v ./.kubeconfig:/app/.kubeconfig \
    -e KUBECONFIG=/app/.kubeconfig \
    -e KUBECONTEXT=prod \
    -e MATTERMOST_CHANNEL=alerts \
    # optional mattermost notification
    -e MATTERMOST_WEBHOOK_URL=prod \
    # optional JQ filter to include/exclude images (default all)
    -e IMAGES_JQ_FILTER=' | select(. | startswith("ghcr.io") | select(. | startswith("ghcr.io/yyy") | not)' \
    ghcr.io/socialgouv/check-cluster-images:latest
```

There's a sample `CronJob` provided in [./cronjob.yaml](./cronjob.yaml)
