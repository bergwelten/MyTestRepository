FROM ubuntu:latest
LABEL maintainer "pimpi@pimpi.at"
ENV TZ="Europe/Vienna"
RUN echo $TZ > /etc/timezone && \
    apt update && \
    apt install -y software-properties-common && \
    add-apt-repository --yes --update ppa:ansible/ansible && \
    apt install -y ansible && \
    apt install -y vim && \
    useradd -d /home/ansible -m -s /usr/bin/bash ansible
WORKDIR /home/ansible
USER ansible
RUN mkdir /home/ansible/.ssh && \
    chmod 700 /home/ansible/.ssh && \
    mkdir /home/ansible/ansible_config
VOLUME ["/home/ansible/ansible_config"]
CMD ["sleep","infinity"]
