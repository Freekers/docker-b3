#!/bin/bash -e
HOME=/data

if [[ !-d "/data/conf" ]]
then
   cp -rp /usr/src/python/src/b3/b3/conf /data/conf
fi

/usr/local/bin/b3_run $@
