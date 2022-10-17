FROM ubuntu:22.04

ENV HOME=/home/builder
ARG UID=1000
RUN useradd -rm -d ${HOME} -u ${UID} builder
WORKDIR ${HOME}

# ||/ Name               Version                 Architecture Description
# +++-==================-=======================-============-=========================================================================
# ii  git                1:2.34.1-1ubuntu1.4     amd64        fast, scalable, distributed revision control system
# ii  cmake              3.22.1-1ubuntu1.22.04.1 amd64        cross-platform, open-source make system
# ii  ninja-build        1.10.1-1                amd64        small build system closest in spirit to Make
# ii  python3            3.10.6-1~22.04          amd64        interactive high-level object-oriented language (default python3 version)
# ii  python3-pip        22.0.2+dfsg-1           all          Python package installer
# ii  python3-venv       3.10.6-1~22.04          amd64        venv module for python3 (default python3 version)
# ii  wget               1.21.2-2ubuntu1         amd64        retrieves files from the web
# ii  bison              2:3.8.2+dfsg-1build1    amd64        YACC-compatible parser generator
# ii  ccache             4.5.1-1                 amd64        Compiler cache for fast recompilation of C/C++ code
# ii  dfu-util           0.9-1                   amd64        Device firmware update (DFU) USB programmer
# ii  flex               2.6.4-8build2           amd64        fast lexical analyzer generator
# ii  gperf              3.1-1build1             amd64        Perfect hash function generator
# ii  libffi-dev:amd64   3.4.2-4                 amd64        Foreign Function Interface library (development files)
# ii  libssl-dev:amd64   3.0.2-0ubuntu1.6        amd64        Secure Sockets Layer toolkit - development files
# ii  libusb-1.0-0:amd64 2:1.0.25-1ubuntu2       amd64        userspace USB programming library

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
 && apt-get install -y \
        git \
        cmake \
        ninja-build \
        wget \
        python3 \
        python3-pip \
        python3-venv \
        bison=2:3.8.2+dfsg-1build1 \
        ccache=4.5.1-1 \
        dfu-util=0.9-1 \
        flex=2.6.4-8build2 \
        gperf=3.1-1build1 \
        libffi-dev:amd64=3.4.2-4 \
        libssl-dev:amd64=3.0.2-0ubuntu1.6 \
        libusb-1.0-0:amd64=2:1.0.25-1ubuntu2 \
  && ln -s /usr/bin/python3 /usr/bin/python

USER builder
