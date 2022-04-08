# Quake3e-Server
Quake3e server packaged as a docker container.

Followed the container creation best practices from Docker as best as I could.

# Instructions
Start your container with the example docker-compose.yml file.
```
docker-compose up
```
Stop the container with Ctrl+C

Copy your .pk3 files along with server.cfg (on this site) to the baseq3 folder that gets created.

Start the container again
```
docker-compose up
```
You should see the server starting without any errors now.

e.g. folder structure
```
.
├── baseq3
│   ├── pak0.pk3
│   ├── pak1.pk3
│   ├── pak2.pk3
│   ├── pak3.pk3
│   ├── pak4.pk3
│   ├── pak5.pk3
│   ├── pak6.pk3
│   ├── pak7.pk3
│   ├── pak8.pk3
│   ├── pak8a.pk3
│   ├── q3config.cfg
│   └── server.cfg
└── docker-compose.yml
```
