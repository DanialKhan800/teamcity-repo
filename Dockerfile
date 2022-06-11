FROM ubuntu:18.04

RUN apt-get update && apt-get -y install cmake protobuf-compiler
RUN apt-get -y install cmake
RUN sudo apt-get install -y build-essential
RUN apt-get install gcc


RUN mkdir /sample
WORKDIR /sample
COPY command.sh .
COPY CMakeLists.txt .
RUN chmod +x ./command.sh
#RUN ./command.sh -x -f ./
RUN ./command.sh
#RUN chmod +x ./command
#RUN cd command
