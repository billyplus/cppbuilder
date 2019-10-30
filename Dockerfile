#FROM billyplus/npm:latest
FROM debian:buster

LABEL author="billy" mail="quiter008@qq.com"

# COPY sources.list /etc/apt/sources.list

ENV XMAKE_ROOT=y

RUN apt-get update && apt-get upgrade
RUN apt-get install -y wget git make gcc ccache build-essential clang libgflags-dev nlohmann-json3-dev libfmt-dev libboost-system-dev libluajit-5.1-dev libpqxx-dev librabbitmq-dev

RUN wget https://raw.githubusercontent.com/tboox/xmake/master/scripts/get.sh -O -

RUN wget https://dl.google.com/go/go1.13.3.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.13.3.linux-amd64.tar.gz \
    && ln -s /usr/local/go/bin/go /usr/bin/go \
    && rm go1.13.3.linux-amd64.tar.gz

# RUN ln -s /root/.local/bin/xmake /usr/bin/xmake

VOLUME [ "/y3/y3pp", "y3/y3-d/server"]

WORKDIR /y3/y3pp

CMD /root/.local/bin/xmake

