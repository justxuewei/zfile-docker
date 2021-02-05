FROM lsiobase/alpine:3.11

ARG ZFILE_VERSION=2.9.0

ENV PUID=1000
ENV PGID=1000
ENV TZ="Asia/Shanghai"

LABEL MAINTAINER="Xavier Niu"

RUN \
    echo ">>>>>> update dependencies <<<<<<" \
    && apk update && apk add tzdata openjdk8 \
    && echo ">>>>>> set up timezone <<<<<<" \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && apk del tzdata \
    && echo ">>>>>> get zfile from github <<<<<<" \
    && wget -O zfile.jar https://github.com/zhaojun1998/zfile/releases/download/${ZFILE_VERSION}/zfile-${ZFILE_VERSION}.jar

VOLUME ["/zfile", "/root/.zfile-new"]

EXPOSE 8080

ENTRYPOINT java -Xms10m -Xmx300m -Djava.security.egd=file:/dev/./urandom -jar zfile.jar
