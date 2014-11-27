#!/usr/bin/env bash
set -o errexit -o pipefail

## Set the btsync directory path
BTSYNC_DIR="/srv/btsync"

## Set update tarball path
UPDATE_TARBAL="${BTSYNC_DIR}/btsync.tar.gz"

## Extract updated binary if updated tarball exists
if [[ -e "${UPDATE_TARBAL}" ]]; then

    ## Extract the binary file into place
    tar -xzvf ${UPDATE_TARBAL} -C ${BTSYNC_DIR} --overwrite

    ## Remove update tarball
    rm -fv ${UPDATE_TARBAL}

fi

## Error if no btsync binary found
if [[ ! -x "${BTSYNC_DIR}/btsync" ]]; then
    echo "ERROR: Could not find btsync binary"; exit 1
fi

## Run btsync in foreground
${BTSYNC_DIR}/btsync --nodaemon --config ${BTSYNC_DIR}/btsync.conf
