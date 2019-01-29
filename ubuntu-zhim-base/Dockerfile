FROM ubuntu
LABEL vendor="SJ roninn.song@gmail.com"
LABEL description="base image: ubuntu18.04"

#WORKDIR /root

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak

COPY sources.list.ubuntu18.04 /etc/apt/sources.list

COPY start.sh /root/

ENV DEBIAN_FRONTEND noninteractive

# Install fcitx and google-pinyin.
RUN \
  apt-get update && apt-get install -y \
  --no-install-recommends --allow-unauthenticated \
  apt-utils locales vim-tiny dbus-x11 alsa-utils \
  fcitx fcitx-googlepinyin ttf-wqy-zenhei && \
  apt-get install -y \
  --no-install-recommends --allow-unauthenticated \
  fcitx-tools fcitx-config* && \
  apt-get install -y \
  --no-install-recommends --allow-unauthenticated \
  fcitx-module* fcitx-ui-* && \
  apt-get clean && apt-get autoclean && \
  rm -rf /var/lib/apt/lists/*

COPY fcitx /root/.config/fcitx
COPY locale /etc/default/locale
COPY locale.gen /etc/locale.gen

ENV LC_CTYPE=zh_CN.UTF-8 \
    XMODIFIERS="@im=fcitx"

RUN \
  locale-gen en_US.UTF-8 zh_CN.UTF-8 \
  zh_CN.GBK && \
  update-locale LANG=zh_CN.UTF-8

# Define default command.
CMD ["/bin/bash", "/root/start.sh"]

# EXPOSE ports.

