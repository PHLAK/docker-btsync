FROM ubuntu:14.04
MAINTAINER Chris Kankiewicz <Chris@ChrisKankiewicz.com>

## Perform apt update / upgrade
RUN apt-get update && apt-get -y upgrade

## Install dependencies
RUN apt-get -y install wget

## Create btsync directories
RUN mkdir /srv/btsync /srv/storage

## Add and chmod update script
ADD files/update.sh /update.sh
RUN chmod +x /update.sh

## Download and extract btsync binary
RUN /update.sh

## Add btsync config
ADD files/btsync.conf /srv/btsync/btsync.conf

## Perform apt cleanup
RUN apt-get -y autoremove && apt-get -y clean && apt-get -y autoclean

## Add and chmod the run file
ADD files/run.sh /run.sh
RUN chmod +x /run.sh

## Define docker volumes
VOLUME /srv/btsync /srv/storage

## Expose ports
EXPOSE 8888 53135

## Default command
CMD ["/run.sh"]
