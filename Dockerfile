#FROM billyplus/npm:latest
FROM debian:buster

LABEL author="billy" mail="quiter008@qq.com"

# COPY sources.list /etc/apt/sources.list

# ENV XMAKE_ROOT=y

RUN apt-get update && apt-get upgrade
RUN apt-get install -y wget curl git make cmake gcc g++ ccache clang liblua5.3-dev unzip tar

RUN curl -L https://github.com/ninja-build/ninja/releases/download/v1.8.2/ninja-linux.zip -o ninja-linux.zip \
    && unzip ninja-linux.zip \
    && mv ninja /usr/local/bin

# COPY xmake.sh /xmake.sh

# RUN /xmake.sh

# RUN curl -fsSL https://raw.githubusercontent.com/tboox/xmake/master/scripts/get.sh

# RUN wget https://github.com/xmake-io/xmake/releases/download/v2.2.8/xmake-v2.2.8.amd64.deb /xmake-v2.2.8.amd64.deb \
#     && dpkg -i /xmake-v2.2.8.amd64.deb \
#     && rm /xmake-v2.2.8.amd64.deb

# RUN wget https://dl.google.com/go/go1.13.3.linux-amd64.tar.gz \
#     && tar -C /usr/local -xzf go1.13.3.linux-amd64.tar.gz \
#     && ln -s /usr/local/go/bin/go /usr/bin/go \
#     && rm go1.13.3.linux-amd64.tar.gz

# RUN git clone https://github.com/Microsoft/vcpkg.git /vcpkg \
#     && cd /vcpkg \
#     && ./bootstrap-vcpkg.sh

# RUN cd /vcpkg \
#     && ./vcpkg install boost-asio \
#     && ./vcpkg install boost-system \
#     && ./vcpkg install fmt \
#     && ./vcpkg install libpqxx \
#     && ./vcpkg install gflags \
#     && ./vcpkg install nlohmann-json \
#     && ./vcpkg install librabbitmq \
#     && ./vcpkg install sol2 \
#     && ./vcpkg install protobuf

# RUN ln -s /root/.local/bin/xmake /usr/bin/xmake
# RUN ln -s /root/.local/bin/xmake /usr/bin/xmake

VOLUME [ "/y3/y3-s", "y3/y3-d/server"]

WORKDIR /y3/y3-s

CMD ["cmake" ,"version"]


