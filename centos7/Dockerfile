FROM centos:7

LABEL maintainer="billy" \
    version="1.0.0"

# RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
# RUN yum install -y epel-release

COPY ./1.repo /etc/yum.repos.d/1.repo
COPY ./2.repo /etc/yum.repos.d/2.repo

RUN yum makecache

RUN yum install -y lua-devel.x86_64 tolua++-devel.x86_64 zlib-devel.x86_64 cmake3.x86_64 ninja-build.x86_64 mysql-community-devel.x86_64

RUN yum install -y gdb.x86_64

RUN yum install -y centos-release-scl

RUN yum install -y devtoolset-9

RUN yum install -y https://packages.endpoint.com/rhel/7/os/x86_64/endpoint-repo-1.7-1.x86_64.rpm

RUN yum install -y git

RUN yum clean all

RUN ln -s /usr/bin/cmake3 /usr/bin/cmake && \
    mv /etc/localtime /etc/localtime.bak && \
    ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN /bin/sh -c echo "source scl_source enable devtoolset-9" >> ~/.bashrc

ENV PATH="/usr/lib64/ccache${PATH:+:${PATH}}"

# RUN bash -c 'echo core.%e.%p > /proc/sys/kernel/core_pattern' && \
#     ulimit -c unlimited

RUN mkdir -p /work/src

WORKDIR /work/src



