# Usage
1. 构建镜像。
docker build -t ubuntu-zhim-base .

2. 启动容器，并进入。
docker run -dti -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --privileged --name zhim-base ubuntu-zhim-base /bin/bash

docker exec -ti ubuntu-zhim-base /bin/bash

3. 中英文切换热键：left-shift
