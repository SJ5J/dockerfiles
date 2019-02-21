# Usage
1. 构建镜像
docker build -t typora-gitbook-chrome .

2. 启动应用容器
	- 方式1 直接启动typora
	```
	docker run -dti -v ~/wine/deepin-wine-ubuntu:/root/deepin-wine-ubuntu -v ~/notebooks:/root/notebooks -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --privileged --name typora-gitbook-chrome  typora-gitbook-chrome /bin/bash
	```

	- 方式2 进入容器，手动启动应用
	```
	docker run -dti -v ~/notebooks:/root/notebooks -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --privileged --name typora-gitbook-chrome typora-gitbook-chrome /bin/bash

	docker exec -ti typora-gitbook-chrome /bin/bash
	nohup typora&
	nohup google-chrome-stable --no-sandbox&
	```
3. 自定义输入法配置
nohup fcitx-configtool&



