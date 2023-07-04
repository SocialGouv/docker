#!/bin/bash

if [ -z "$KUBECONFIG" ]; then
    echo "Environment variable KUBECONFIG is mandatory"
    exit 1
fi;
if [ -z "$KUBECONTEXT" ]; then
    echo "Environment variable KUBECONTEXT is mandatory"
    exit 1
fi;

#
# dump all docker images used in cluster with kubectl
#
CONTAINERS=$(kubectl --context "$KUBECONTEXT" get pods --all-namespaces -o json | jq '.items[] | {namespace:.metadata.namespace,name:.metadata.name,image:.spec.containers[].image}')
INITCONTAINERS=$(kubectl --context "$KUBECONTEXT" get pods --all-namespaces -o json | jq  '.items[] | select(.spec.initContainers | length > 0) | {namespace:.metadata.namespace,name:("initcontainer-" + .metadata.name),image:.spec.initContainers[].image}')
JOBS=$(kubectl --context "$KUBECONTEXT" get jobs --all-namespaces -o json | jq  '.items[] | {namespace:.metadata.namespace,name:("job-" + .metadata.name),image:.spec.template.spec.containers[].image}')
CRONJOBS=$(kubectl --context "$KUBECONTEXT" get cronjobs --all-namespaces -o json | jq  '.items[] | {namespace:.metadata.namespace,name:("cronjob-" + .metadata.name),image:.spec.jobTemplate.spec.template.spec.containers[].image}')

#
# filter our images only
#
IMAGES=$(echo "$CRONJOBS" "$JOBS" "$CONTAINERS" "$INITCONTAINERS" | jq -rs '[.[] .image] | [.[] '"${IMAGES_JQ_FILTER}"'] | unique | sort | .[]')

#
# check images on registry with skopeo
#
IMAGES_ARR=(${IMAGES})
unavailableImages=()

echo ""
echo "🌍 Fetching ${#IMAGES_ARR[@]} docker images on context $KUBECONTEXT"
echo ""

for row in $IMAGES; do
    set +e
    skopeo inspect --retry-times 3 docker://$row &>/dev/null
    status="$?"
    set -e
    if [ "$status" -eq 0 ]
    then
        echo "  ✅ $row"
    else
        echo "  ❌ $row"
        unavailableImages+=( "$row" )
    fi
done

FOOTER=""

if [ "${#unavailableImages[@]}" -eq 0 ]
then
    MARKDOWN_MESSAGE="😎 What a beautiful day, all ${#IMAGES_ARR[@]} images on ${KUBECONTEXT} cluster are available.\n\nHave fun !"
    MARKDOWN_MESSAGE="$MARKDOWN_MESSAGE$FOOTER"

    echo ""
    echo -e "$MARKDOWN_MESSAGE"
    echo ""
else
    MARKDOWN_MESSAGE="😱 ${#unavailableImages[@]}/${#IMAGES_ARR[@]} docker images are missing from ${KUBECONTEXT} cluster\n\n"

    for image in "${unavailableImages[@]}"; do
        MARKDOWN_MESSAGE="$MARKDOWN_MESSAGE - $image\n"
    done

    MARKDOWN_MESSAGE="$MARKDOWN_MESSAGE$FOOTER"

    echo ""
    echo -e "$MARKDOWN_MESSAGE"
    echo ""

    # send to mattermost
    if [ -n "$MATTERMOST_WEBHOOK_URL" ]; then
        echo "MATTERMOST_WEBHOOK_URL: $MATTERMOST_WEBHOOK_URL"
        curl -i -X POST -H "Content-Type: application/json" -d '{"channel": "'"${MARKDOWN_CHANNEL}"'", "text": "'"${MARKDOWN_MESSAGE}"'"}' "${MATTERMOST_WEBHOOK_URL}"
    fi;

    exit 1
fi

exit 0