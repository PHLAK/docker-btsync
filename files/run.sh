#!/usr/bin/env bash
set -o errexit -o pipefail


## SCRIPT VARIABLES
########################################

## Set the btsync directory path
BTSYNC_DIR="/srv/btsync"

## Set config path
CONFIG="${BTSYNC_DIR}/btsync.conf"

## Set update tarball path
UPDATE_TARBAL="${BTSYNC_DIR}/btsync.tar.gz"


## PRE-RUN CONFIGURATION
########################################

## Set device name if not yet set
if [[ ! -z "$(grep '{{DEVICE_NAME}}' ${CONFIG})" ]]; then

    ## Check for DEVICE_NAME env var
    if [[ -z "${DEVICE_NAME}" ]]; then
        echo "ERROR: DEVICE_NAME environment variable not set"; exit 1
    fi

    ## Set device_name value
    sed -i -e "s/{{DEVICE_NAME}}/${DEVICE_NAME}/" ${CONFIG}

fi

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


## SCRIPT ACTIONS
########################################

## Run btsync in foreground
${BTSYNC_DIR}/btsync --nodaemon --config ${BTSYNC_DIR}/btsync.conf
