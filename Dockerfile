FROM debian:9-slim
LABEL maintainer="Snowind <jinks.tao@gmail.com" \
      description="a docker image for xxd server"

ARG XXD_URL=http://dl.cnezsoft.com/xuanxuan/1.6/xxd.1.6.0.linux.x64.tar.gz

ENV LISTEN_IP=127.0.0.1
ENV CHAT_PORT=11444
ENV COMMON_PORT=11443
ENV IS_HTTPS=NO
ENV UPLOAD_PATH=tmpfile/
ENV UPLOAD_FILE_SIZE=32M
ENV RANZHI_ADDRESS=http://127.0.0.1
ENV RANZHI_PORT=80
ENV XUANXUAN_TOKEN=88888888888888888888888888888888
ENV LOG_PATH=log/
ENV CERT_PATH=cert/

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install curl tar --no-install-recommends -y && \
    apt-get clean

RUN curl -o xxd.tar.gz $XXD_URL && \
    mv xxd.tar.gz /tmp/

COPY xxd.conf /tmp/
COPY startup.sh /usr/sbin/
RUN chmod +x /usr/sbin/startup.sh

ENTRYPOINT [ "/usr/sbin/startup.sh" ]
