#!/usr/bin/env sh

WWW_DIRECTORY=${WWW_DIRECTORY:="/usr/share/nginx/html"}
GLOB=${GLOB:="*"}

##############################################################
# Step 1 : replace default environment values in .html files #
##############################################################

# Save env variable in file
printenv >> env-vars

while IFS='=' read -r KEY VALUE
do
  # replace default environment variables value
  find ${WWW_DIRECTORY} -type f -exec sed -i -e "s|%%${KEY}%%|${VALUE}|g" {} \;
done <env-vars

rm env-vars

#########################
# Step 2 : Start NGINX  #
#########################

exec nginx -g 'daemon off;'
