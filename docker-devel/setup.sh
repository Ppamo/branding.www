#!/bin/bash
IMAGENAME=ppamo.cl/branding.web.develop
IMAGETAG=v1.0.0
IMAGEVERSION=v1.0.0

# check if docker is running
docker info > /dev/null 2>&1
if [ $? -ne 0 ]
then
	echo "Cannot connect to the Docker daemon. Is the docker daemon running on this host?"
	exit -1
fi

# check if the Dockerfile is in the folder
if [ ! -f Dockerfile ]
then
	echo "Dockerfile is not present, please run the script from right folder"
	exit -1
fi

# check if the docker image exists
docker images | grep "$IMAGENAME" | grep "$IMAGETAG" > /dev/null 2>&1
if [ $? -ne 0 ]
then
	# create the docker image
	docker build -t $IMAGENAME:$IMAGEVERSION -t $IMAGENAME:$IMAGETAG ./
	if [ $? -ne 0 ]
	then
		echo "docker build failed!"
		exit -1
	fi
fi

# run a container from $IMAGENAME image
docker run -di --publish-all "$IMAGENAME:$IMAGETAG"
