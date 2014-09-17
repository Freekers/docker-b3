#!/bin/bash -e
HOME=/data

if [[ ! -d "/data/conf" ]]
then
   cp -rp /opt/b3/b3/.conf /data/conf
fi
if [[ ! -d "/data/extplugins" ]]
then
   cp -rp /opt/b3/b3/.extplugins /data/extplugins
fi

if [[ -L "/opt/b3/b3/conf" ]]
then
   ln -s /data/conf /opt/b3/b3/conf
fi
if [[ -L "/opt/b3/b3/extplugins" ]]
then
   ln -s /data/extplugins /opt/b3/b3/extplugins
fi

/usr/bin/python /opt/b3/b3_run.py $@
