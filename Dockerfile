# Take the base Ubuntu 20.04 as a starting point, it's one of the smaller base images around.
# Using a multi stage build to make the Dockerfile clear and easy to change and try and follow best practices.
# Stage 1 - Get the files ready. This is a temporary environment, so it doesn't matter about removing files we don't need.
FROM ubuntu:20.04 AS temp

# Install unzip and curl to download Quake3e server and unzip the file
RUN apt-get update
RUN apt-get install -y unzip curl

# Create a folder called /q3e and move into it.
WORKDIR /q3e

# Download this file, it will go into /q3e due to the WORKDIR command from before.
# curl -O is to download the file with the default name of the name, if you don't include -O it will try and show the contents of the file.
# -L is to allow redirects, or curl will download the redirect page.
RUN curl -L -O https://github.com/ec-/Quake3e/releases/download/2021-10-14/quake3e-linux-x86_64.zip

# Unzip the file to directory /q3e
RUN unzip quake3e-linux-x86_64.zip -d /q3e

# Stage 2 - Build the image using Ubuntu as a base image again.
FROM ubuntu:20.04

# Copy the files we need from stage 1
COPY --from=temp /q3e/quake3e.ded.x64 /q3e/

# Create a dedicated user
# -r is a system account
# You wouldn't normally create a home folder for the user with -m -d /home/quake3e but Quake fails if it doesn't exist.
# Also make the server executable so it will run.
RUN \
    groupadd -r quake3e \
    && useradd --no-log-init -r -g quake3e quake3e -m -d /home/quake3e \
    && chmod +x /q3e/quake3e.ded.x64

# Switch to running as the quake3e user.
USER quake3e

# When the container starts, run the Quake3e server with the server.cfg file
CMD ["/q3e/quake3e.ded.x64", "+exec", "server.cfg"]

# Expose UDP port 27960, this is the port that Quake3e clients connect to.
EXPOSE 27960/udp

# Expose the folder /q3e/baseq3 to the host, so we can copy the needed Quake3e resources files.
VOLUME /q3e/baseq3
