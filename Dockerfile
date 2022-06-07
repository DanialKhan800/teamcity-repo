FROM centos:centos7.9.2009
RUN mkdir /sample
WORKDIR /sample
COPY command.sh /sample
RUN chmod +x ./command.sh
