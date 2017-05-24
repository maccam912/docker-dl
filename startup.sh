#!/bin/bash

set -e

echo "Copy the NVidia drivers from the parent (because nvidia-docker-plugin doesn't work with ECS agent)"
find /hostusr -name "*nvidia*" -o -name "*cuda*" -o -name "*GL*" | while read path
do
  echo "Found ${path#/hostusr}"
  newpath="/usr${path#/hostusr}"
  mkdir -p `dirname $newpath` && \
    cp -ar -v $path $newpath
done

echo "Found all of it"

cp -ar -v /hostlib/modules /lib

echo "Copy libs"

echo "/usr/lib64" > /etc/ld.so.conf.d/nvidia.conf
ldconfig

echo "ld configged"

echo "Starting your essential task"
exec jupyter notebook --ip 0.0.0.0 --port 8888 --allow-root
