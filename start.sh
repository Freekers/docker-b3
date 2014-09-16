#!/bin/bash -e
HOME=/data

if [[ ! -d "/data/conf" ]]
then
   cp -rp /opt/b3/conf /data/conf
fi

/usr/bin/python /opt/b3/b3_run.py $@
