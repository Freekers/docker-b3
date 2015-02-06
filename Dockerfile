FROM ubuntu-debootstrap:14.04
MAINTAINER Martijn van Maurik <docker@vmaurik.nl>

ENV HOME /data
VOLUME /data

RUN apt-get update
RUN apt-get install -y tar git curl nano wget dialog net-tools build-essential python-mysqldb python python-dev python-distribute python-pip
RUN apt-get install -y libsqlite3-dev sqlite3

WORKDIR /opt

RUN git clone https://github.com/BigBrotherBot/big-brother-bot.git /opt/b3
RUN cd /opt/b3 && git checkout -b release-1.10 origin/release-1.10
RUN mv /opt/b3/b3/conf /opt/b3/b3/.conf
RUN mv /opt/b3/b3/extplugins /opt/b3/b3/.extplugins

RUN pip install -r /opt/b3/pip-requires.txt

ADD start.sh /opt/start.sh
RUN chmod +x /opt/start.sh

ENTRYPOINT ["/opt/start.sh"]
CMD ["--help"]
