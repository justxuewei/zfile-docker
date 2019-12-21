FROM alpine
RUN apk update && apk add tzdata openjdk8 git \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata \
    && cd /root \
    && wget https://www-eu.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz \
    && tar -xzf apache-maven-3.6.3-bin.tar.gz \
    && git clone https://github.com/zhaojun1998/zfile.git \
    && cd zfile \
    && /root/apache-maven-3.6.3/bin/mvn package --file pom.xml \
    && mv target/zfile-*.jar /

VOLUME ["/zfile", "/root/.zfile"]
EXPOSE 8080
ENTRYPOINT java -Xms10m -Xmx300m -Djava.security.egd=file:/dev/./urandom -jar zfile-*.jar
