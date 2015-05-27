FROM ubuntu:14.04

ENV PATH=$PATH:/opt/Nim/bin:/root/.nimble/bin

RUN apt-get -y update && \
    apt-get install -y libc-dev gcc curl git && \
    mkdir -p /opt && cd /opt && \
    git clone https://github.com/Araq/Nim.git && \
    cd Nim && sh build.sh && cd /opt && \
    git clone https://github.com/nim-lang/nimble.git && \
    cd nimble && nim c -r src/nimble install && \
    rm -rf /opt/Nim/csources && rm -rf /opt/Nim/tests && \
    rm -rf /opt/nimble
    
RUN nimble update && nimble install jester

ADD . /src
WORKDIR /src
