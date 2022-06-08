FROM ubuntu
RUN mkdir /sample
WORKDIR /sample
CMD [ "apt-get", "install" , "-y", "g++", "cmake", "build-essential" ]
COPY command.sh /sample
RUN chmod +x ./command.sh
RUN ./command.sh -x -f ./
RUN chmod +x ./command
