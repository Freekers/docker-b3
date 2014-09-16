FROM python:2.7
MAINTAINER Martijn van Maurik <docker@vmaurik.nl>

RUN pip install -e git+git://github.com/BigBrotherBot/big-brother-bot.git@release-1.10#egg=b3

VOLUME /data

ENTRYPOINT ["/usr/local/bin/b3_run"]

CMD ["-c", "/data/b3.xml"]