FROM ubuntu:18.04

RUN apt-get update && apt-get -y install cmake protobuf-compiler
RUN apt-get -y install cmake

RUN mkdir /sample
WORKDIR /sample
COPY command.sh /sample
RUN chmod +x ./command.sh
RUN ./command.sh -x -f ./
#RUN ./command.sh
RUN chmod +x ./command
RUN cd command
