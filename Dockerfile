FROM mcr.microsoft.com/devcontainers/base:jammy

# Yocto Support
RUN apt-get update && apt-get install -y \
    bc \
    build-essential \
    chrpath \
    cpio \
    debianutils \
    diffstat \
    dos2unix \
    fop \
    g++-multilib \
    gawk \
    gcc-multilib \
    git-core \
    git-lfs \
    iputils-ping \
    libegl1-mesa \
    libncurses5-dev \
    libsdl1.2-dev \
    python3 \
    python3-dev \
    python3-git \
    python3-jinja2 \
    python3-pexpect \
    python3-pip \
    socat \
    texinfo \
    tmux \
    unzip \
    vim \
    wget \
    xsltproc \
    xterm \
    openssl \
    tree \
    xz-utils \
    make \
    curl \
    libssl-dev \
    libboost-system-dev \
    libboost-thread-dev \
    libboost-dev \
    libseccomp-dev \
    libgmp-dev

# Erlang Support
WORKDIR /opt
RUN wget https://github.com/erlang/otp/releases/download/OTP-25.3.2.7/otp_src_25.3.2.7.tar.gz && \
    tar -zxf otp_src_25.3.2.7.tar.gz && \
    rm otp_src_25.3.2.7.tar.gz && \
    cd otp_src_25.3.2.7 && \
    export ERL_TOP=`pwd` && \
    ./configure && \
    export LANG=C && \
    make && \
    make install

# Rebar3 Support
WORKDIR /opt/rebar3
RUN wget https://s3.amazonaws.com/rebar3/rebar3 && \
    chmod +x rebar3 && \
    HOME=/opt ./rebar3 local install && \
    ln /opt/.cache/rebar3/bin/rebar3 /usr/local/bin/rebar3

# CloudI Support
WORKDIR /opt/cloudi
RUN wget --no-check-certificate https://osdn.net/dl/cloudi/cloudi-2.0.6.tar.gz && \
    tar zxvf cloudi-2.0.6.tar.gz && \
    rm cloudi-2.0.6.tar.gz && \
    cd cloudi-2.0.6/src && \
    ./configure --enable-java-support=no --enable-javascript-support=no --enable-perl-support=no --enable-php-support=no --enable-python-support=no --enable-python-c-support=no --enable-ruby-support=no --with-integration-tests=no && \
    make && \
    make install
