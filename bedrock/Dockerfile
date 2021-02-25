FROM ubuntu:20.04
LABEL app=bedrock
RUN echo "eula=true" > /usr/local/eula.txt
RUN apt-get update -y ; apt-get upgrade -y ; apt-get install -y unzip curl
RUN mkdir -p /usr/local/logs /usr/local/mods
RUN chgrp -R 0 /run /usr/local /var/cache /var/log /var/run && chmod -R g=u /run /usr/local /var/cache /var/log /var/run 
COPY bedrock-server-1.16.201.03.zip /usr/local/
RUN cd /usr/local ; unzip bedrock-server-1.16.201.03.zip
EXPOSE 25565
EXPOSE 19132
ENV LD_LIBRARY_PATH=/usr/local/
WORKDIR /usr/local/
ENTRYPOINT /usr/local/bedrock_server 
