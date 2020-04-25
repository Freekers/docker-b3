FROM ubuntu:bionic

ENV DEBIAN_FRONTEND noninteractive

ENV HOME /data
VOLUME /data

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install --no-install-recommends git build-essential python python-pip python-distribute libsqlite3-dev && \ 
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN git clone https://github.com/BigBrotherBot/big-brother-bot.git /opt/b3 && \
    mv /opt/b3/b3/conf /opt/b3/b3/.conf && \
    mv /opt/b3/b3/extplugins /opt/b3/b3/.extplugins && \
    mv /opt/b3/b3/parsers /opt/b3/b3/.parsers && \
    pip install wheel && \
    pip install -r /opt/b3/requirements.txt

ADD start.sh /opt/start.sh
RUN chmod +x /opt/start.sh

ENTRYPOINT ["/opt/start.sh"]
CMD ["--help"]
