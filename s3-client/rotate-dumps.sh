#!/usr/bin/env bash

set -e

aws s3 ls $DESTINATION_PATH/ | grep " DIR " -v | while read -r line;
  do
    createDate=`echo $line | awk {'print $1" "$2'}`
    createDate=`date -d "$createDate" +%s`
    olderThan=`date -d "-$RETENTION_DAYS days" +%s`

    if [[ $createDate -lt $olderThan ]]
      then 
        fileName=`echo $line | awk {'print $4'}`
        if [[ $fileName != "" ]]
          then
            echo "Deleting $DESTINATION_PATH/$fileName"
            aws s3 rm "$DESTINATION_PATH/$fileName" 
        fi
    fi
  done;