FROM debian:10-slim
MAINTAINER sebastian@delphi-sucks.de
RUN apt-get update
RUN apt-get install -y lazarus

WORKDIR /usr/lib/lazarus/2.0.0/components
RUN make
