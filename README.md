# Big Brother Bot (B3) as Docker
Runs current latest head from master at https://github.com/BigBrotherBot/big-brother-bot

# Usage
Create `data` folder with following folder structure:
```
/opt/b3/data
├── conf
├── extplugins
├── parsers
```
All folders are optional, i.e. if you don't use custom parsers, you don't have to create the directory `parsers` and the default parsers from the Big Brother Bot repo will be used. However, if you *do* create the folder, make sure to add *ALL* parsers you use, not just the custom ones.

In the examples below, the config file has been saved in `/opt/b3/b3/conf/` on the host, which matches the same location in the docker container.

## docker run
`docker run -ti -v /opt/b3:/data --rm freekers/docker-b3:latest -c /opt/b3/b3/conf/cod2_server1.xml`

## docker-compose.yml
```
version: '3.7'
services:
  b3:
    image: freekers/docker-b3:latest
    container_name: b3
    restart: always
    volumes:
     - /opt/cod2/server1/server1.log:/var/log/server1.log
     - /opt/b3/b3:/data
    command: -c /opt/b3/b3/conf/cod2_server1.xml
```
