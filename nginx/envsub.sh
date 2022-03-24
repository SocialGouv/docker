#!/usr/bin/env sh

################################################################################
# Replace environment values in files                                          #
################################################################################

#
# As default, in every files in the "/usr/share/nginx/html" directory, this
# script replaces `%%KEY%%` by `VALUE` where `export KEY=VALUE` in the global env var.
#

WWW_DIRECTORY=${WWW_DIRECTORY:="/usr/share/nginx/html"}
DELIMITER=${DELIMITER:="%%"}

# Save env variable in file
printenv > /tmp/env-vars

# Add default nginx port
echo "PORT=${PORT:="8080"}" >> /tmp/env-vars

while IFS='=' read -r KEY VALUE
do
  # In every files in the dir, replace the environment variables value
  [ -z "$SKIP_ENVSUBST" ] && find ${WWW_DIRECTORY} -type f -regex ".*\.\(conf\|txt\|html\|htm\|js\|css\)"  -exec \
    sed -i -e "s|${DELIMITER}${KEY}${DELIMITER}|${VALUE}|g" {} \;
  # replace in nginx.conf too
  sed -i -e "s|${DELIMITER}${KEY}${DELIMITER}|${VALUE}|g" /etc/nginx/nginx.conf

done < /tmp/env-vars

rm /tmp/env-vars
