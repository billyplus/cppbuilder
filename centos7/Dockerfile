FROM centos:7

LABEL maintainer="billy" \
    version="1.0.0"

# RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
# RUN yum install -y epel-release

COPY ./centos7/1.repo /etc/yum.repos.d/1.repo
COPY ./centos7/2.repo /etc/yum.repos.d/2.repo

RUN yum makecache

RUN yum install -y lua-devel.x86_64 tolua++-devel.x86_64 zlib-devel.x86_64 gcc-c++.x86_64 cmake3.x86_64 ninja-build.x86_64 mysql-community-devel.x86_64

RUN ln -s /usr/bin/cmake3 /usr/bin/cmake && \
    ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /work/src

WORKDIR /work/src



