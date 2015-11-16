FROM debian:latest
MAINTAINER Konstantinos Koukopoulos <koukopoulos@gmail.com>

RUN apt-get update

RUN apt-get install -y openssh-server git

RUN mkdir /var/run/sshd

RUN useradd -ms /usr/bin/git-shell git && passwd -d git

COPY sshd_config /etc/ssh/sshd_config

RUN mkdir /home/git/.ssh

RUN touch /home/git/.ssh/authorized_keys && chmod 600 /home/git/.ssh/authorized_keys && chown -R git:git /home/git/.ssh

ADD ./init.sh /

EXPOSE 22
ENTRYPOINT cd / && ./init.sh
