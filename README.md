# Quake3e-Server
Quake3e server packaged as a docker container.

# Instructions
Start your container with the example docker-compose.yml file.

You can run it without compose using something like the below. Replace the /opt/quake3e-server/baseq3 with an actual folder on your server.

`docker run -d --name=quake3e-server -p 27960:27960/udp -v /opt/quake3e-server/baseq3:/q3e/baseq3 ghcr.io/zummigummi/quake3e-server:latest`
  
Once your container starts, a new folder called baseq3 will be created.

Copy your .pk3 files into this folder, along with your server.cfg file.

e.g. folder structure
```
/opt/quake3e-server/docker-compose.yml
/opt/quake3e-server/baseq3/pak0.pk3
...
/opt/quake3e-server/baseq3/pak8a.pk3
/opt/quake3e-server/baseq3/server.cfg
```
Restart your container so everything gets reloaded.
