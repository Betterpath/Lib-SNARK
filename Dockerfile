FROM ubuntu:16.04
MAINTAINER brandon@betterpath.com
ENV LAST_UPDATED 2017
RUN apt-get update && apt-get install -y build-essential cmake git libgmp3-dev \
    libprocps4-dev python-markdown libboost-all-dev libssl-dev pkg-config && \
    apt-get clean
RUN mkdir /code
ADD . /code
WORKDIR /code/build 
RUN cmake ..
RUN make
RUN make doc
RUN make check

