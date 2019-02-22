FROM ubuntu:18.04
LABEL vendor="SJ roninn.song@gmail.com"
LABEL description="base image: ubuntu18.04"

# WORKDIR /root
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
COPY sources.list.ubuntu18.04 /etc/apt/sources.list
COPY start.sh /root/
ENV DEBIAN_FRONTEND noninteractive

# Install fcitx and google-pinyin.
RUN \
  apt-get update && apt-get install -y \
  --no-install-recommends --allow-unauthenticated \
  aptitude apt-utils locales vim-tiny \
  dbus-x11 alsa-utils \
  fcitx fcitx-googlepinyin ttf-wqy-zenhei && \
  apt-get install -y --no-install-recommends \
  --allow-unauthenticated fcitx-tools fcitx-config* && \
  apt-get install -y --no-install-recommends \
  --allow-unauthenticated fcitx-module* fcitx-ui-* && \
  aptitude install -y gnome-terminal && \
  apt-get clean && apt-get autoclean && \
  rm -rf /var/lib/apt/lists/* /var/cache/apt/*

COPY locale /etc/default/locale
COPY locale.gen /etc/locale.gen
COPY fcitx /root/.config/fcitx 

ENV LC_CTYPE=zh_CN.UTF-8 \
    XMODIFIERS="@im=fcitx"
    
# zh_CN.GB2312 报错
RUN \
  locale-gen en_US.UTF-8 zh_CN.UTF-8 \
  zh_CN.GBK && \
  update-locale LANG=zh_CN.UTF-8

# Define default command.
CMD ["/bin/bash", "/root/start.sh"]

