#!/bin/sh

retry=${RETRIES:-120};
while ! curl -sSfL $URL && [[ $(( retry-- )) -gt 0 ]];
do
  echo "Waiting for $URL... ($(( retry )))" ; sleep 5s ;
done ;
[[ $(( retry )) -lt 1 ]] && exit 128;
echo Ready;
