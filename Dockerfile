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
RUN mkdir -p /opt/app-root/bin
RUN mkdir -p /opt/app-root/share
USER root

RUN yum install \
    && https://repo.ius.io/ius-release-el7.rpm \
    && https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

RUN curl https://oss.oracle.com/el4/unzip/unzip.tar -o unzip.tar \
    && tar -xf unzip.tar \
    && mv unzip /opt/app-root/bin

RUN curl -L https://github.com/ninja-build/ninja/releases/download/v1.8.2/ninja-linux.zip -o ninja-linux.zip \
    && unzip ninja-linux.zip \
    && mv ninja /opt/app-root/bin
# COPY ninja-linux.zip ninja-linux.zip
# COPY unzip.tar unzip.tar
# COPY cmake-3.16.1-Linux-x86_64.tar.gz cmake-3.16.1-Linux-x86_64.tar.gz

# RUN tar -xf unzip.tar \
#     && mv unzip /opt/app-root/bin
# RUN unzip ninja-linux.zip \
#     && mv ninja /opt/app-root/bin

RUN curl -L https://github.com/Kitware/CMake/releases/download/v3.16.1/cmake-3.16.1-Linux-x86_64.tar.gz -o cmake-3.16.1-Linux-x86_64.tar.gz \
    && tar -xzf cmake-3.16.1-Linux-x86_64.tar.gz \
    && cp cmake-3.16.1-Linux-x86_64/bin/* ../bin \
    && cp -r cmake-3.16.1-Linux-x86_64/share/* ../share

RUN rm cmake-3.16.1-Linux-x86_64.tar.gz \
    && rm -rf cmake-3.16.1-Linux-x86_64 \
    && rm ninja-linux.zip \
    && rm unzip.tar
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



