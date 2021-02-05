# Quake3e-Server
Quake3e server packaged as a docker container.

This is a learning excercise for me on how to create my own container images.

# Instructions
Start your container with the example docker-compose.yml file.

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
