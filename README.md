# Minecraft demo
Build the minecraft container image using the Dockerfile
```
docker build --build-arg `constraints:ostype==linux` -t $name/build:tag .
```
The image can now be pushed and scanned in DTR; this illistrates how the binary level scan can pick apart a java package.

Deploy minecraft server in kubernetes
```
kubectl create ns minecraft
kubectl -n minecraft -f deployment-minecraft.yaml -f service-minecraft.yaml
```
This exposes node port "25565", which minecraft clients may bind to; however, I use a nodePort of 30065 across the workers for port mapping to nodes from teh service.
