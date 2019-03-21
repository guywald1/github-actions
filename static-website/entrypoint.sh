#!/bin/bash

set -e
export AZURE_HTTP_USER_AGENT="GITHUBACTIONS_${GITHUB_ACTION_NAME}_${GITHUB_REPOSITORY}"

LINUX_APP_SUBSTRING="linux"

if [[ -z $AZURE_STORAGE_ACCOUNT ]];
then 
    echo "Required Azure Storage name. Provide value in AZURE_STORAGE_ACCOUNT variable" >&2
    exit 1
fi

if [[ -z $SAS_TOKEN && -z $AZURE_STORAGE_KEY ]];
then 
    echo "Either a SAS Token (provided in SAS_TOKEN variable) or a Storage Account Key (provided in AZURE_STORAGE_KEY) are required" >&2
    exit 1
fi

echo "Uploading \`/public\` to ${AZURE_STORAGE_ACCOUNT}/\$web"

az storage blob upload-batch -d "\$web" -s public

echo "Successfully uploaded \`/public\` to ${AZURE_STORAGE_ACCOUNT}/\$web"