FROM alpine:3.11
LABEL author=SJ

ARG GIT_USERNAME="SJ5J"
ARG GIT_EMAIL="song-jian1234@163.com"

WORKDIR /root

# github免密，使用密钥认证
# ssh-keygen -t rsa -C "song-jian1234@163.com" （需要输入 /root/.ssh/id_rsa_github，然后两次回车）
# 打印出公钥，然后粘帖到github：点github的头像-> settings-> SSH and GPG keys->右上角New SSH key
# cat /root/.ssh/id_rsa_github.pub
# 测试 ssh -T git@github.com
COPY id_rsa id_rsa.pub /root/.ssh/

RUN echo "*************intall git************" && \
    echo "$(sed 's/\(nameserver \)\S*/\1223.5.5.5/' /etc/resolv.conf)" > /etc/resolv.conf && \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories && \
    apk update && apk add --no-cache bash git openssh && \
    rm -rf /tmp/* && \
    echo "**********Config git**********" && \
    git config --global user.name $GIT_USERNAME && \
    git config --global user.email $GIT_EMAIL && \
    chmod 600 /root/.ssh/id_rsa

CMD ["/bin/bash"]
