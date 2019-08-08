#!/bin/bash

if [ $# != 1 ]
then
	echo "Error. Usage: please at least provide 1 Parameter." && exit 1
fi

docker run -d -it --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro --name testSystemd $1
