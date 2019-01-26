FROM ubuntu
MAINTAINER SJ roninn.song@gmail.com

#WORKDIR /root

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak


COPY start.sh /root/
COPY sources.list.ubuntu18.04 /etc/apt/sources.list

# Install fcitx and google-pinyin.
RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y \
  --no-install-recommends --allow-unauthenticated \
  locales vim-tiny dbus-x11 alsa-utils \
  fcitx fcitx-googlepinyin ttf-wqy-zenhei && \
  apt-get install -y --no-install-recommends \
  --allow-unauthenticated fcitx-tools fcitx-config* && \
  apt-get install -y --no-install-recommends \
  --allow-unauthenticated fcitx-module* fcitx-ui-* && \
  apt-get clean && apt-get autoclean && \
  rm -rf /var/lib/apt/lists/*

    
# Define default command.
CMD ["/bin/bash", "/root/start.sh"]

# EXPOSE ports.

