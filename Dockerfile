FROM openjdk
LABEL app=mindcraft
LABEL APPROVED=no
RUN yum install -y unzip
RUN echo "eula=true" > /usr/local/eula.txt
EXPOSE 25565
COPY minecraft_server.1.15.2.jar /usr/local
COPY MedievalVillage.zip /usr/local
RUN cd /usr/local \
    && mkdir -p logs \
    && unzip MedievalVillage.zip \
    && rm -rf world \
    && mv MedievalVillage world
RUN mkdir -p /usr/local/logs
RUN groupadd -g 100001 appuser \
    && useradd -u 100001 appuser -g appuser \
    && chown -R appuser /usr/local /var/cache /var/log /var/run
# RUN chgrp -R 0 /run && chmod -R g=u /run
# RUN chmod +x /usr/local /var/cache /var/log /var/run /usr/local/logs
WORKDIR /usr/local
USER appuser
ENTRYPOINT java -Xmx2G -Xms2G -jar minecraft_server.1.15.2.jar nogui
