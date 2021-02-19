## Simple Minecraft Java Server on OpenShift

This is simple java server using nodePort service to map ports 30065/tcp to container port 22565/tcp. To access it from your local network, use a loadbalancer mapping ingress port 25565/tcp to the worker nodes on port 30065/tcp.

To Do:
Enable Custom Worlds using persistant volumes (nfs?).
