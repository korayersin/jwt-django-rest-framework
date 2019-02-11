FROM python:3.6-alpine

ENV PYTHONUNBUFFERED 1
ENV INSTALL_PATH /web_api


RUN mkdir -p /var/tmp/django_cache
RUN rm -f /var/tmp/django_cache/*

RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY /requirements/development.txt /requirements/development.txt

RUN pip3 install -r /requirements/development.txt

RUN apk add --update bash && rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ADD . /web_api/
