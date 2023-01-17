# sudo apt-get update -y
# sudo apt-get install -y curl git software-properties-common ansible
# 
# git clone https://github.com/lucashtm/ansible.git
# cd ansible
ansible-playbook --ask-vault-pass --ask-become-pass local.yml
