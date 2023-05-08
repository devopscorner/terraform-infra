#!/bin/sh

# ================================================================================================
#  INSTALL USER-DATA (Ubuntu LINUX)
# ================================================================================================
export DEBIAN_FRONTEND=noninteractive

export ANSIBLE_VERSION=2.12.2
export PACKER_VERSION=1.7.10
export TERRAFORM_VERSION=1.1.6
export TERRAGRUNT_VERSION=v0.36.1

export DOCKER_PATH="/usr/bin/docker"
export DOCKER_COMPOSE_PATH="/usr/bin/docker-compose"
export DOCKER_COMPOSE_VERSION="1.29.2"

sudo apt-get update
sudo apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install \
    git \
    bash \
    curl \
    wget \
    jq \
    apt-transport-https \
    ca-certificates \
    openssh-server \
    openssh-client \
    net-tools \
    vim-tiny \
    tmux \
    mc \
    nano \
    zip \
    unzip \
    ruby \
    python3-minimal \
    python3-distutils \
    python3-pip \
    python3-apt \
    python2.7 \
    iputils-ping

# ================================================================================================
#  INSTALL DOCKER (Ubuntu Linux)
# ================================================================================================
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update
sudo apt-cache policy docker-ce

sudo apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install \
    docker-ce

# ================================================================================================
#  INSTALL DOCKER-COMPOSE
# ================================================================================================
sudo curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m) -o $DOCKER_COMPOSE_PATH
sudo chmod +x /usr/bin/docker-compose

# ================================================================================================
#  INSTALL DevOps TOOLS
# ================================================================================================
## install awscli
sudo apt-get install -y \
    awscli nodejs &&
    # install terraform
    wget -O terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
        https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip &&
    sudo unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin &&
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip &&
    # install terragrunt
    wget -O /usr/local/bin/terragrunt \
        https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 &&
    sudo chmod +x /usr/local/bin/terragrunt &&
    # install packer
    wget -O packer_${PACKER_VERSION}_linux_amd64.zip \
        https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip &&
    sudo unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/local/bin &&
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

sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 10

## install tfenv
git clone https://github.com/tfutils/tfenv.git $HOME/.tfenv
echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> $HOME/.bash_profile
ln -sf $HOME/.tfenv/bin/* /usr/local/bin
sudo mkdir -p $HOME/.local/bin/
. $HOME/.profile
ln -sf $HOME/.tfenv/bin/* $HOME/.local/bin

# Cleanup Cache
sudo apt-get clean &&
    sudo apt-get autoremove -y

##### CUSTOMIZE $HOME/.profile #####
touch $HOME/.profile
echo '' >> $HOME/.profile
echo '### Docker ###
export DOCKER_CLIENT_TIMEOUT=300
export COMPOSE_HTTP_TIMEOUT=300' >> $HOME/.profile

##### CONFIGURE DOCKER #####
sudo usermod -a -G docker ubuntu

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
