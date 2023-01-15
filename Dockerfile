FROM ubuntu:latest
ARG TAGS
ARG USER=lucas
RUN groupadd -r $USER && useradd -r -g $USER $USER
# USER $USER
WORKDIR /usr/local/bin
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y software-properties-common && apt-add-repository -y ppa:ansible/ansible && apt update && apt install -y curl git ansible build-essential
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
