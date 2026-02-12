# build docker develop environment by Ubuntu
FROM ubuntu:24.04

RUN apt-get -qq update && \
yes | unminimize   > /dev/null && \
 DEBIAN_FRONTEND=noninteractive apt-get -y upgrade \
 bash-completion \
 curl \
 vim \
 gcc \
 g++ \
 make \
 sudo \
 htop \
 nano \
 python3 \
 vim \
 wget \
 openssh-server \
  > /dev/null

RUN curl -LsSf https://astral.sh/uv/install.sh | sh

ADD ./run.sh ./run.sh

ENTRYPOINT ["/bin/bash", "./run.sh"]
