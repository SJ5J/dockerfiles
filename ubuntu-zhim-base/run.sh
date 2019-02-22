#!/bin/bash

run=$1
image=$2
container=$3

if [ "$image" == '' ]; then
	image="ubuntu-zhim-base"
fi

if [ "$container" == '' ]; then
	container="ubuntu-zhim-base"
fi

if [ "$run" == 'build' ]; then
	docker build -t $image .

elif [ "$run" == 'attach' ]; then
	docker run -dti -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY \
		--privileged --name $container $image /bin/bash

	docker exec -ti $container /bin/bash

elif [ "$run" == '' ] ; then
	docker run -dti -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY \
		--privileged --name $container $image

else
	echo "Unknown argument..."
fi

