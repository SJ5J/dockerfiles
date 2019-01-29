#!/bin/bash
docker run -dti -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY \
           --privileged --name ubuntu-zhim-base ubuntu-zhim-base /bin/bash

docker exec -ti ubuntu-zhim-base /bin/bash
