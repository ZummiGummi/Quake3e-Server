# Using Ubuntu, because I tried Alpine, but the server wouldn't run.
# Take the base Ubuntu 20.04 as a starting point.
FROM ubuntu:20.04

# Create a folder called /q3e and move into it.
WORKDIR /q3e

# Download this file, it will go into /q3e due to the WORKDIR command from before.
ADD https://github.com/ec-/Quake3e/releases/download/2021-03-28/quake3e-linux-x86_64.zip ./

# Using one long command broken into multiple lines to prevent multiple layers in image and keep image small.
# Install unzip, because it's not included in the base Ubuntu image.
# Unzip the Quake3e zip we downloaded earlier.
# Remove unzip since we no longer need it. --purge removes configuration files while autoremove removes the package including dependencies.
# apt clean to removed cached packages
# Remove apt package list
# Delete client Quake3e files, we are only interested in the server part.
# Make the Quake3e server file executable.
RUN \
    apt update \
    && apt install unzip -y \ 
    && unzip quake3e-linux-x86_64.zip -d /q3e \    
    && apt --purge autoremove unzip -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm quake3e-linux-x86_64.zip \
    && rm /q3e/quake3e-vulkan.x64 \
    && rm /q3e/quake3e.x64 \
    && chmod +x quake3e.ded.x64
    
# When the container starts, run the Quake3e server with the server.cfg file
CMD ["/q3e/quake3e.ded.x64", "+exec", "server.cfg"]

# Expose UDP port 27960, this is the port that Quake3e clients connect to.
EXPOSE 27960/udp

# Expose the folder /q3e/baseq3 to the host, so we can copy the needed Quake3e resources files.
VOLUME /q3e/baseq3
