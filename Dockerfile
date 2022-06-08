FROM ubuntu

ADD CMAKE .
RUN mkdir /sample
WORKDIR /sample
COPY command.sh /sample
RUN chmod +x ./command.sh
RUN ./command.sh -x -f ./
RUN chmod +x ./command
