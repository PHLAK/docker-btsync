docker-btsync
===================

**!!! UNMAINTAINED !!!** - I am no longer be maintaing this image.

-----

Docker container for Bittorent Sync server.


### Running the container

    docker run -d -p 8888:8888 -p 51315:51315 -e DEVICE_NAME=[SERVER_NAME] -v /srv/btsync --name BTSync phlak/btsync

**NOTE:** Replace `[SERVER_NAME]` with the your desired server name.


### Expose host directory to the container

You can expose a directory on the host machine to the container by adding `-v /local/dir:/mnt` to
your `docker run` command.

**NOTE:** Replace `/local/dir` with the directory path on the host you'd like to expose.


### Updating btsync server

Update to latest version:

    docker exec BTSync /update.sh

Update to a specific version:

    docker exec BTSync /update.sh [URL_TO_BTSYNC_TARBALL]


-----

**Copyright (c) 2014 Chris Kankewicz <Chris@ChrisKankiewicz.com>**

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
