#FROM billyplus/npm:latest
FROM centos/devtoolset-7-toolchain-centos7

LABEL author="billy" mail="quiter008@qq.com"

ARG NINJA_VERSION=1.9.0.g99df1.kitware.dyndep-1.jobserver-1

# COPY sources.list /etc/apt/sources.list

# RUN apt-get update && apt-get upgrade
# RUN apt-get install -y wget curl git make cmake gcc g++ ccache clang liblua5.3-dev unzip tar

# RUN curl -fsSL https://raw.githubusercontent.com/tboox/xmake/master/scripts/get.sh

# RUN wget https://github.com/xmake-io/xmake/releases/download/v2.2.8/xmake-v2.2.8.amd64.deb /xmake-v2.2.8.amd64.deb \
#     && dpkg -i /xmake-v2.2.8.amd64.deb \
#     && rm /xmake-v2.2.8.amd64.deb

# RUN wget https://dl.google.com/go/go1.13.3.linux-amd64.tar.gz \
#     && tar -C /usr/local -xzf go1.13.3.linux-amd64.tar.gz \
#     && ln -s /usr/local/go/bin/go /usr/bin/go \
#     && rm go1.13.3.linux-amd64.tar.gz

RUN yum install unzip

RUN curl https://github.com/ninja-build/ninja/releases/download/v1.8.2/ninja-linux.zip -o ninja-linux.zip \
    && unzip ninja-linux.zip \
    && mv ninja /usr/local/bin

RUN curl -fsSL https://github.com/Kitware/CMake/releases/download/v3.16.1/cmake-3.16.1-Linux-x86_64.sh

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

# VOLUME [ "/y3/y3pp", "y3/y3-d/server"]

# WORKDIR /y3/y3pp

CMD xmake


