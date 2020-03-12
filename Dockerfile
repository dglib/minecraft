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
RUN addgroup -g 100001 -S appuser && adduser -u 100001 -S appuser -G appuser
RUN chown -R appuser:appuser /usr/local /var/cache /var/log /var/run /opt/openjdk-15/bin
RUN chmod +x /usr/local /var/cache /var/log /var/run /usr/local/logs
USER appuser
WORKDIR /usr/local
ENTRYPOINT java -Xmx1024M -Xms1024M -jar minecraft_server.1.15.2.jar nogui