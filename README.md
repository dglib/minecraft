## Simple Minecraft Java Server on OpenShift

### Bedrock
* New : Added /bedrock/Dockerfile \
Build your own image or fetch shaker242/minecraft:bedrock

Bedrock is still Alpha at this time, but it's up and running on OCP 4.x \
Bedrock runs against two IPv4 ports, the primary port is 19132/tcp \
NodePort is mapped to 30132/tcp in the .yaml files.

### Minecraft
This is simple java server using NodePort service to map ports 30065/tcp to pod/container port 22565/tcp. 

To access it from your local network, use a loadbalancer mapping ingress port 25565/tcp to the worker nodes on port 30065/tcp.

* Additonal items
1. Forge is added to help with loading worlds : shaker242/minecraft:forged
2. ConfigMap is used for your server.properties customizations
3. Worlds are extracted on persistant storage and mapped with pvc's

