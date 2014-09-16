FROM ubuntu:14.04
MAINTAINER Martijn van Maurik <docker@vmaurik.nl>

ENV HOME /data
VOLUME /data

RUN apt-get update
RUN apt-get install -y tar git curl nano wget dialog net-tools build-essential python-mysqldb python python-dev python-distribute python-pip

WORKDIR /opt

RUN git clone https://github.com/BigBrotherBot/big-brother-bot.git /opt/b3
RUN cd /opt/b3 && git checkout -b release-1.10 origin/release-1.10

RUN pip -r /opt/b3/pip-requires.txt

ADD start.sh /opt/start.sh
RUN chmod +x /opt/start.sh

ENTRYPOINT ["/opt/start.sh"]
CMD ["--help"]
