FROM ubuntu:20.04
WORKDIR /q3e
ADD https://github.com/ec-/Quake3e/releases/download/latest/quake3e-linux-x86_64.zip ./
RUN \
    apt update \
    && apt install unzip -y \
    && unzip quake3e-linux-x86_64.zip -d /q3e \
    && apt remove unzip \
    && rm -rf /var/lib/apt/lists/* \
    && rm quake3e-linux-x86_64.zip \
    && rm /q3e/quake3e-vulkan.x64 \
    && rm /q3e/quake3e.x64 \
    && chmod +x quake3e.ded.x64

ENTRYPOINT ["/q3e/quake3e.ded.x64"]
CMD ["exec", "server.cfg"]

EXPOSE 27960/udp
VOLUME /q3e/baseq3
