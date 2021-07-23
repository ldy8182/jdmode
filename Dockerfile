FROM node:lts-alpine3.14

ENV JD_DIR=/jd
ENV CUSTOM_SHELL_FILE=https://gist.githubusercontent.com/mixool/dbbb7614f2ec7fd14ff3d424bfe30266/raw

RUN apk update \
    && apk add --no-cache bash curl wget unzip grep tzdata git coreutils moreutils openssl jq openssh-client python3 py3-pip \
    && npm install pm2@latest -g \
    && pip install Telethon \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && mkdir -p /jd/config /jd/log /jd/tmp \
    && rm -rf /var/cache/apk/* 
    
COPY docker_entrypoint.sh /usr/local/bin

RUN chmod +x /usr/local/bin/docker_entrypoint.sh

WORKDIR /jd

ENTRYPOINT ["docker_entrypoint.sh"]

CMD [ "crond" ]