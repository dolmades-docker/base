FROM ubuntu:16.04

MAINTAINER Stefan Kombrink

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get -y install wget less vim software-properties-common python3-software-properties apt-transport-https winbind yad p7zip-full && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN wget https://dl.winehq.org/wine-builds/Release.key && apt-key add Release.key && apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/ && rm Release.key
RUN mkdir -p /wineprefix && chmod +rwx /wineprefix

COPY targetLauncher /usr/local/bin/targetLauncher
RUN mkdir /.dolmades

ENV WINEPREFIX /wineprefix
ENV WINEARCH win32
