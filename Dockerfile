FROM debian:10-slim

MAINTAINER Sebastian <sebastian@delphi-sucks.de>

ENV LAZARUS_LINK="https://sourceforge.net/projects/lazarus/files/Lazarus%20Linux%20amd64%20DEB/Lazarus%202.0.12/lazarus-project_2.0.12-0_amd64.deb/download"
ENV FPC_LAZ_LINK="https://sourceforge.net/projects/lazarus/files/Lazarus%20Linux%20amd64%20DEB/Lazarus%202.0.12/fpc-laz_3.2.0-1_amd64.deb/download"

RUN apt-get update
RUN apt-get install -y --no-install-recommends wget binutils libgtk2.0-dev ca-certificates

RUN wget $FPC_LAZ_LINK -O fpc-laz_amd64.deb
RUN dpkg -i fpc-laz_amd64.deb
RUN rm fpc-laz_amd64.deb

RUN wget $LAZARUS_LINK -O lazarus-project_amd64.deb
RUN dpkg -i --ignore-depends=fpc-src lazarus-project_amd64.deb
RUN rm lazarus-project_amd64.deb

RUN rm -r /usr/share/lazarus/*/docs
RUN rm -r /usr/share/lazarus/*/examples
