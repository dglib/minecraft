#FROM openjdk:12-jdk-alpine
FROM registry.access.redhat.com/ubi7/ubi
# USER root
LABEL app=minecraft
LABEL APPROVED=no
RUN mkdir /opt/minecraft \
    && echo "eula=true" > /opt/minecraft/eula.txt
EXPOSE 25565
COPY server.jar /opt/minecraft/
COPY MedievalVillage.zip  /opt/minecraft/
RUN yum -y install java-11-openjdk unzip\
    && cd /opt/minecraft \
    && unzip MedievalVillage.zip \
    && rm -rf world \
    && mv MedievalVillage world
WORKDIR /opt/minecraft/
ENTRYPOINT java -Xms1G -Xmx2G -Djava.nio.channels.spi.SelectorProvider=sun.nio.ch.PollSelectorProvider -jar server.jar nogui
