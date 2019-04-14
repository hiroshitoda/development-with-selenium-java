FROM ubuntu:18.04

EXPOSE 22 4401 4403 6080 9515 9876

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=ja_JP.UTF-8 \
    LANGUAGE=ja_JP.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=600 \
    SUPERVISORD_CONF=/etc/supervisor/conf.d/vnc.conf \
    JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre \
    PATH=${JAVA_HOME}/bin:$PATH

RUN apt update && \
    apt install git net-tools supervisor unzip wget \
        xvfb fluxbox novnc x11vnc \
        openjdk-8-jdk maven gradle \
        chromium-browser chromium-chromedriver \
        fonts-ipaexfont language-pack-ja -y
RUN update-locale LANG=ja_JP.UTF-8

RUN echo '[supervisord] \n\
nodaemon=true \n\
[program:Xvfb] \n\
command=/usr/bin/Xvfb '${DISPLAY}' -screen 0 '${DISPLAY_WIDTH}'x'${DISPLAY_HEIGHT}'x24 \n\
autorestart=true \n\
[program:x11vnc] \n\
command=/usr/bin/x11vnc \n\
autorestart=true \n\
[program:novnc] \n\
command=/usr/share/novnc/utils/launch.sh --vnc localhost:5900 \n\
autorestart=true \n\
[program:fluxbox] \n\
command=fluxbox \n\
autorestart=true \n' > ${SUPERVISORD_CONF}
RUN cat ${SUPERVISORD_CONF}

ENV MAVEN_VERSION=3.3.9 \
    JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64 \
    TOMCAT_HOME=/tomcat8 \
    TERM=xterm \
    M2_HOME=/apache-maven-$MAVEN_VERSION \
    PATH=$JAVA_HOME/bin:$M2_HOME/bin:$PATH
RUN mkdir -p /tomcat8 /apache-maven-$MAVEN_VERSION /.m2 /jdtls/data && \
    wget -qO- "http://apache.ip-connect.vn.ua/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz" | tar -zx --strip-components=1 -C /apache-maven-$MAVEN_VERSION/ && \
    wget -qO- "http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.24/bin/apache-tomcat-8.0.24.tar.gz" | tar -zx --strip-components=1 -C /tomcat8 && \
    rm -rf /tomcat8/webapps/*

WORKDIR /projects

CMD ["sh", "-c", "/usr/bin/supervisord -c ${SUPERVISORD_CONF}"]
