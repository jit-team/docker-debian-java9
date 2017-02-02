FROM debian:latest
MAINTAINER jitsolutions

RUN echo oracle-java9-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

RUN apt-get update; \
    apt-get install -y oracle-java9-installer oracle-java9-set-default; \
    rm -rf /var/cache/oracle-jdk9-installer