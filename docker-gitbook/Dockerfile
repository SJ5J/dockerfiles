FROM node:10.23-alpine
LABEL author=SJ

EXPOSE 4000 
WORKDIR /root
COPY book.json book_init_start.sh /root/

# 修改用户目录的.gitbook\versions\3.2.3\lib\output\website\copyPluginAssets.js文件，把112行的confirm改为false。
# npm config set registry https://registry.npm.taobao.org
RUN echo "*************intall and Config gitbook************" && \
    echo "$(sed 's/\(nameserver \)\S*/\1223.5.5.5/' /etc/resolv.conf)" > /etc/resolv.conf && \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories && \
    apk update && \
    apk add --no-cache bash openssh && \
    #npm install -g cnpm --registry=https://registry.npm.taobao.org && \
    #cnpm install -g gitbook-cli && \
    npm config set registry https://registry.npm.taobao.org -g && \
    npm install -g gitbook-cli && \
    gitbook -V && \
    npm cache clear --force && \
    rm -rf /tmp/* && \
    chmod 777 /root/book_init_start.sh

# docker run -d --rm --name container image init
# ENTRYPOINT ["/bin/sh", "-c", "/root/book_init_start.sh"]
CMD /bin/sh -c "/root/book_init_start.sh init"
