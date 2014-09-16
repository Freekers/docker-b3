FROM python:2.7
MAINTAINER Martijn van Maurik <docker@vmaurik.nl>

ENV HOME /data
VOLUME /data

RUN apt-get update && apt-get install python-mysqldb -qy

RUN pip install b3

ADD start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
CMD ["--help"]
