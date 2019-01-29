FROM ubuntu-zhim-base
LABEL vendor="SJ roninn.song@gmail.com"
LABEL description="base image: ubuntu18.04"

#WORKDIR /root
COPY start.sh /root/

ENV DEBIAN_FRONTEND noninteractive

# Install fcitx and google-pinyin.
RUN \
  apt-get update && apt-get install -y \
    --no-install-recommends --allow-unauthenticated \
    gnupg software-properties-common libapt-pkg-dev \
    apt-transport-https libgtk-3-0 libxss1 libnss3 \
    libasound2 packagekit-gtk3-module libcanberra-gtk3-module libxtst6 && \
    apt-key adv --keyserver keyserver.ubuntu.com \
    --recv-keys BA300B7755AFCFAE && \
    add-apt-repository 'deb https://typora.io/linux ./' && \
    apt-get update && apt-get install -y typora && \
    apt-get clean && apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# Define default command.
CMD ["/bin/bash", "/root/start.sh"]

# EXPOSE ports.

