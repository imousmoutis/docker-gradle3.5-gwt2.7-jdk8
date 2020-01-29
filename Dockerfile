FROM ubuntu:16.04

RUN apt-get update && \ 
    apt-get upgrade -y && \
    apt-get install -y wget && \
    apt-get -y install software-properties-common

RUN apt-get update && \
    add-apt-repository -y ppa:openjdk-r/ppa && \
    apt-get -y update && \
    apt-get -y install openjdk-8-jdk

RUN apt-get -y install git && \
    apt-get -y install unzip

RUN wget https://services.gradle.org/distributions/gradle-3.5-bin.zip -P /tmp && \
    unzip -d /opt/gradle /tmp//gradle-3.5-bin.zip 

RUN wget http://storage.googleapis.com/gwt-releases/gwt-2.7.0.zip -P /tmp && \
    unzip -d /opt /tmp/gwt-2.7.0.zip

RUN apt-get -y install curl && \
	curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
	apt-get -y install nodejs && \
	ln -s "$(which nodejs)" /usr/local/bin/node

ENV GRADLE_HOME=/opt/gradle/gradle-3.5
ENV PATH=$PATH:$GRADLE_HOME/bin

CMD ["/bin"]