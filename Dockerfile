FROM resin/rpi-raspbian:latest
#FROM drewderivative/docker-raspbian-nagios:latest
#FROM tmb28054/rpi-raspbian:latest
#FROM owlab/debian-jessie-arm64:latest

RUN [ "cross-build-start" ]

RUN apt-get update
RUN apt-get install -y curl openssh-server ca-certificates apt-transport-https 
RUN curl https://packages.gitlab.com/gpg.key | apt-key add - 

RUN apt-get install -y postfix

RUN curl -sS https://packages.gitlab.com/install/repositories/gitlab/raspberry-pi2/script.deb.sh | bash

RUN apt-get update

RUN EXTERNAL_URL="http://gitlab.rock" apt-get install gitlab-ce


RUN [ "cross-build-end" ]
