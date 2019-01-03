# Minecraft demo
Build the minecraft container image using the Dockerfile
```
docker build --build-arg `constraints:ostype==linux` -t dtr.docker.ee/dev/craft .
```
The image can now be pushed and scanned in DTR; this illistrates how the binary level scan can pick apart a java package.

Deploy minecraft server using the crafty.yaml file
```
docker stack deploy -c crafty.yaml svr
```
This exposes node port "25565", which minecraft clients may bind to.
