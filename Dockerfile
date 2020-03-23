FROM openjdk:15-ea-jdk-alpine
LABEL app=mindcraft
LABEL APPROVED=no
RUN echo "eula=true" > /usr/local/eula.txt
EXPOSE 25565
COPY minecraft_server.1.15.2.jar /usr/local/
# COPY MedievalVillage.zip  /usr/local/
RUN cd /usr/local \
    && mkdir -p logs 
# RUN umask 0002
# RUN unzip MedievalVillage.zip \
#     && rm -rf world \
#     && mv MedievalVillage world
RUN mkdir -p /usr/local/logs 
RUN addgroup -g 100001 -S appuser && adduser -u 100001 -S appuser -G appuser
RUN chown -R appuser /usr/local /var/cache /var/log /var/run
# RUN chgrp -R 0 /run && chmod -R g=u /run
# RUN chmod +x /usr/local /var/cache /var/log /var/run /usr/local/logs
WORKDIR /usr/local
# USER appuser
ENTRYPOINT java -Xmx2G -Xms2G -jar minecraft_server.1.15.2.jar nogui