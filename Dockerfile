FROM openjdk:latest
LABEL app=minecraft
RUN echo "eula=true" > /usr/local/eula.txt
EXPOSE 25565
COPY minecraft_server.1.16.5.jar /usr/local/
RUN mkdir -p /usr/local/logs
RUN chgrp -R 0 /run /usr/local /var/cache /var/log /var/run && chmod -R g=u /run /usr/local /var/cache /var/log /var/run 
WORKDIR /usr/local
ENTRYPOINT java -Xmx2G -Xms2G -jar minecraft_server.1.16.5.jar nogui
