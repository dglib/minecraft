# FROM registry.access.redhat.com/ubi7/ubi
# # USER root
# LABEL app=minecraft
# LABEL APPROVED=no
# RUN mkdir /opt/minecraft \
#     && echo "eula=true" > /opt/minecraft/eula.txt
# EXPOSE 25565
# COPY server.jar /opt/minecraft/
# COPY MedievalVillage.zip  /opt/minecraft/
# RUN yum -y install java-11-openjdk unzip\
#     && cd /opt/minecraft \
#     && unzip MedievalVillage.zip \
#     && rm -rf world \
#     && mv MedievalVillage world
# WORKDIR /opt/minecraft/
# ENTRYPOINT java -Xms1G -Xmx2G -Djava.nio.channels.spi.SelectorProvider=sun.nio.ch.PollSelectorProvider -jar server.jar nogui
FROM openjdk:15-ea-jdk-alpine
LABEL app=mindcraft
LABEL APPROVED=no
RUN echo "eula=true" > /usr/local/eula.txt
EXPOSE 25565
COPY minecraft_server.1.15.2.jar /usr/local/
# COPY MedievalVillage.zip  /usr/local/
RUN cd /usr/local \
    && mkdir -p logs
# RUN unzip MedievalVillage.zip \
#     && rm -rf world \
#     && mv MedievalVillage world
RUN addgroup -g 10001 -S appuser && adduser -u 10001 -S appuser -G appuser
RUN chown -R appuser:appuser /usr/local /var/cache /var/log /var/run /opt/openjdk-15/bin
RUN chmod +x /usr/local /var/cache /var/log /var/run /usr/local/logs
USER appuser
WORKDIR /opt/minecraft
ENTRYPOINT java -Xmx1024M -Xms1024M -jar minecraft_server.1.15.2.jar nogui