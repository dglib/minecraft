FROM openjdk:12-jdk-alpine
# USER root
LABEL app=mindcraft
LABEL APPROVED=no
RUN echo "eula=true" > /usr/local/eula.txt
EXPOSE 25565
# COPY --chown=nobody:0 server.jar /usr/src/
COPY server.jar /usr/local/
#COPY Medieval_Village.properties /usr/local/server.properties
COPY MedievalVillage.zip  /usr/local/
RUN cd /usr/local \
    && unzip MedievalVillage.zip \
    && rm -rf world \
    && mv MedievalVillage world
WORKDIR /usr/local/
# USER nobody
CMD java -Xms1G -Xmx2G -Djava.nio.channels.spi.SelectorProvider=sun.nio.ch.PollSelectorProvider -jar server.jar nogui