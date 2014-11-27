#!/usr/bin/env bash
set -o errexit -o pipefail

## Set the download URL
DOWNLOAD_URL="http://download.getsyncapp.com/endpoint/btsync/os/linux-x64/track/stable"

## Override the download URL
if [[ ! -z "${1}" ]]; then
    DOWNLOAD_URL="${1}"
fi

## Check if file exists
FILE_EXISTS="$(wget --spider -qO /dev/null ${DOWNLOAD_URL} && echo 'true' || echo 'false')"

## Error on non-existent download file
if [[ "${FILE_EXISTS}" == false ]]; then
    echo "ERROR: Unable to locate file for download"; exit 1
fi

## Fetch the file
wget --verbose -O /srv/btsync/btsync.tar.gz ${DOWNLOAD_URL}
