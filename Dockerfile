FROM debian:10-slim

MAINTAINER Sebastian <sebastian@delphi-sucks.de>

ENV LAZARUS_LINK="https://sourceforge.net/projects/lazarus/files/Lazarus%20Linux%20amd64%20DEB/Lazarus%202.0.8/lazarus-project_2.0.8-0_amd64.deb/download"
ENV FPC_LAZ_LINK="https://sourceforge.net/projects/lazarus/files/Lazarus%20Linux%20amd64%20DEB/Lazarus%202.0.8/fpc-laz_3.0.4-1_amd64.deb/download"
ENV FPC_SRC_LINK="https://sourceforge.net/projects/lazarus/files/Lazarus%20Linux%20amd64%20DEB/Lazarus%202.0.8/fpc-src_3.0.4-2_amd64.deb/download"

ENV FPC_VERSION="3.0.4"

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget binutils libgtk2.0-dev ca-certificates make

RUN wget -nv $FPC_LAZ_LINK -O fpc-laz_amd64.deb && \
    dpkg -i fpc-laz_amd64.deb && \
    rm fpc-laz_amd64.deb

RUN wget -nv $FPC_SRC_LINK -O fpc-src_amd64.deb && \
    dpkg -i fpc-src_amd64.deb && \
    rm fpc-src_amd64.deb

RUN wget -nv $LAZARUS_LINK -O lazarus-project_amd64.deb && \
    dpkg -i lazarus-project_amd64.deb && \
    rm lazarus-project_amd64.deb

RUN cd /usr/share/fpcsrc/$FPC_VERSION && \
    make clean all OS_TARGET=win32 CPU_TARGET=i386 && \
    make crossinstall OS_TARGET=win32 CPU_TARGET=i386 INSTALL_PREFIX=/usr && \
    ln -sf /usr/lib/fpc/$FPC_VERSION/ppcross386 /usr/bin/ppcross386

RUN cd /usr/share/fpcsrc/$FPC_VERSION && \
    make clean all OS_TARGET=win64 CPU_TARGET=x86_64 && \
    make crossinstall OS_TARGET=win64 CPU_TARGET=x86_64 INSTALL_PREFIX=/usr && \
    ln -sf /usr/lib/fpc/$FPC_VERSION/ppcrossx64 /usr/bin/ppcrossx64

RUN cd /usr/share/fpcsrc/$FPC_VERSION && \
    make clean

RUN rm -r /usr/share/lazarus/*/docs && \
    rm -r /usr/share/lazarus/*/examples
