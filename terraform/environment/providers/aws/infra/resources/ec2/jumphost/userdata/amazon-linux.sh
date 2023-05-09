#!/bin/sh

# ================================================================================================
#  INSTALL USER-DATA (AMAZON LINUX)
# ================================================================================================
export ANSIBLE_VERSION=2.12.2
export PACKER_VERSION=1.7.10
export TERRAFORM_VERSION=1.1.6
export TERRAGRUNT_VERSION=v0.36.1

export DOCKER_PATH="/usr/bin/docker"
export DOCKER_COMPOSE_PATH="/usr/bin/docker-compose"
export DOCKER_COMPOSE_VERSION="1.29.2"

sudo yum update
sudo yum install -y \
    git \
    bash \
    curl \
    wget \
    jq \
    nano \
    zip \
    unzip \
    tmux \
    mc \
    vim \
    ruby \
    python3 \
    python2.7

# ================================================================================================
#  INSTALL DOCKER (Amazon Linux)
# ================================================================================================
sudo amazon-linux-extras install docker

# ================================================================================================
#  INSTALL DOCKER-COMPOSE
# ================================================================================================
sudo curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m) -o $DOCKER_COMPOSE_PATH
sudo chmod +x /usr/bin/docker-compose

# install terraform
wget -O terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip &&
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin &&
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip &&
    # install terragrunt
    wget -O /usr/local/bin/terragrunt \
        https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 &&
    chmod +x /usr/local/bin/terragrunt &&
    # install packer
    wget -O packer_${PACKER_VERSION}_linux_amd64.zip \
        https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip &&
    unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/local/bin &&
    rm -f packer_${PACKER_VERSION}_linux_amd64.zip

python3 -m pip install pip==21.3.1 &&
    pip3 install --upgrade pip cffi &&
    # install ansible
    pip3 install --no-cache-dir ansible-core==${ANSIBLE_VERSION} \
        ansible-tower-cli==3.3.4 \
        PyYaml \
        Jinja2 \
        httplib2 \
        six \
        requests \
        boto3

## install tfenv
git clone https://github.com/tfutils/tfenv.git $HOME/.tfenv
echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> $HOME/.bash_profile
sudo ln -sf $HOME/.tfenv/bin/* /usr/local/bin
sudo mkdir -p $HOME/.local/bin/
. $HOME/.profile
ln -sf $HOME/.tfenv/bin/* $HOME/.local/bin

##### CUSTOMIZE $HOME/.profile #####
touch $HOME/.profile
echo '' >> $HOME/.profile
echo '### Docker ###
export DOCKER_CLIENT_TIMEOUT=300
export COMPOSE_HTTP_TIMEOUT=300' >> $HOME/.profile

##### CONFIGURE DOCKER #####
sudo usermod -a -G docker ec2-user

sudo ln -snf $DOCKER_PATH /usr/bin/dock
sudo ln -snf $DOCKER_COMPOSE_PATH /usr/bin/dcomp

##### CONFIGURE CodeDeploy #####
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
chmod +x ./install
./install auto

## Set Locale
sudo touch /etc/environment
sudo echo 'LANG=en_US.utf-8' >> /etc/environment
sudo echo 'LC_ALL=en_US.utf-8' >> /etc/environment

## Adding Custom Sysctl
sudo echo 'vm.max_map_count=524288' >> /etc/sysctl.conf
sudo echo 'fs.file-max=131072' >> /etc/sysctl.conf
