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
    xz-utils

# Erlang Support
RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
    dpkg -i erlang-solutions_1.0_all.deb && \
    apt-get update && apt-get install -y \
    policykit-1 \
    make \
    curl \
    erlang-base \
    erlang-crypto \
    erlang-syntax-tools \
    erlang-inets \
    erlang-mnesia \
    erlang-runtime-tools \
    erlang-ssl \
    erlang-public-key \
    erlang-asn1 \
    erlang-os-mon \
    erlang-snmp \
    erlang-xmerl \
    erlang-dev \
    erlang-parsetools \
    erlang-src \
    erlang-eunit

# NodeJS Support
RUN apt-get update && apt-get install -y \
    nodejs \
    rsync
