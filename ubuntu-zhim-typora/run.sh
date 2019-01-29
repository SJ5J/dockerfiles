#!/bin/bash
#docker run -dti -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY \
#           --privileged --name ubuntu-zhim-typora ubuntu-zhim-typora /bin/bash

#docker exec -ti ubuntu-zhim-typora 

docker run -dti -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY \
           --privileged --name ubuntu-zhim-typora ubuntu-zhim-typora


