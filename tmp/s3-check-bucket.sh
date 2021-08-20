#!/bin/bash
export AWS_CONFIG_FILE=./aws.profile

# aws s3api list-buckets | jq -r '.Buckets[].Name' > bucket-list.txt

for bucket in `cat ./bucket-list.txt`
do
  aws s3api get-bucket-website --bucket $bucket 2>&1 > ./output/${bucket}.log
  if [ $? -eq 0 ]; then
      echo ${bucket}
  fi
done
