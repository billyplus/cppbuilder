#FROM billyplus/npm:latest
FROM debian:buster

LABEL author="billy" mail="quiter008@qq.com"

# COPY sources.list /etc/apt/sources.list

ENV XMAKE_ROOT=y

RUN apt-get update && apt-get upgrade
RUN apt-get install -y wget curl git make gcc ccache build-essential clang libluajit-5.1-dev unzip tar

RUN bash <(curl -fsSL https://raw.githubusercontent.com/tboox/xmake/master/scripts/get.sh)

# RUN wget https://dl.google.com/go/go1.13.3.linux-amd64.tar.gz \
#     && tar -C /usr/local -xzf go1.13.3.linux-amd64.tar.gz \
#     && ln -s /usr/local/go/bin/go /usr/bin/go \
#     && rm go1.13.3.linux-amd64.tar.gz

RUN git clone https://github.com/Microsoft/vcpkg.git ~/.vcpkg \
    && cd ~/.vcpkg \
    && ./bootstrap-vcpkg.sh

RUN cd ~/.vcpkg \
    && ./vcpkg install boost-system \
    && ./vcpkg install libpqxx \
    && ./vcpkg install gflags \
    && ./vcpkg install nlohmann-json \
    && ./vcpkg install fmt \
    && ./vcpkg install amqpcpp \
    && ./vcpkg install protobuf

# RUN ln -s /root/.local/bin/xmake /usr/bin/xmake

VOLUME [ "/y3/y3pp", "y3/y3-d/server"]

WORKDIR /y3/y3pp

CMD xmake


