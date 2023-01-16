FROM ubuntu:latest
ARG TAGS
ARG USER=lucas
RUN groupadd -r $USER && useradd -mrs /bin/bash -g $USER $USER
RUN printf "$USER:12345678" | chpasswd
RUN adduser $USER sudo
WORKDIR /usr/local/bin
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y software-properties-common && apt-add-repository -y ppa:ansible/ansible && apt update && apt install -y curl git ansible build-essential sudo
COPY . .
USER $USER
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
