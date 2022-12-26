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
    sudo curl -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
        https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip &&
    sudo unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin &&
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip &&
    # install terragrunt
    sudo curl -o /usr/local/bin/terragrunt \
        https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 &&
    sudo chmod +x /usr/local/bin/terragrunt &&
    # install packer
    sudo curl -o packer_${PACKER_VERSION}_linux_amd64.zip \
        https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip &&
    sudo unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/local/bin &&
    rm -f packer_${PACKER_VERSION}_linux_amd64.zip

python3 -m pip install pip==21.3.1 &&
    pip3 install --upgrade pip cffi awscli &&
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

# Cleanup Cache
sudo apt-get clean &&
    sudo apt-get autoremove -y

## install tfenv
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >>~/.bash_profile
ln -sf ~/.tfenv/bin/* /usr/local/bin
mkdir -p ~/.local/bin/
. ~/.profile
ln -sf ~/.tfenv/bin/* ~/.local/bin

##### CONFIGURE CodeDeploy #####
# wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
# chmod +x ./install
# ./install auto
sudo curl -s https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install | bash -s auto

## Set Locale
sudo echo 'LANG=en_US.utf-8' >>/etc/environment
sudo echo 'LC_ALL=en_US.utf-8' >>/etc/environment

## Adding Custom Sysctl
sudo echo 'vm.max_map_count=524288' >>/etc/sysctl.conf
sudo echo 'fs.file-max=131072' >>/etc/sysctl.conf

################################################

echo "//------------- Setup WorkspaceLab Repository -------------//"
echo "//------------- Setup WorkspaceLab Repository -------------//"
sudo mkfs -t ext4 /dev/nvme1n1

sudo mkdir -p /opt/data/docker

sudo mount /dev/nvme1n1 /opt/data

sudo cp /etc/fstab /etc/fstab.backup

sudo echo UUID=$(blkid -o value -s UUID /dev/nvme1n1) /opt/data ext4 defaults,nofail 0 2 >>/etc/fstab

sudo mount -a

sudo mkdir -p /opt/data/docker/ubuntu
sudo mkdir -p /opt/data/docker/phpfpm8.1
sudo mkdir -p /opt/data/docker/nginx
sudo mkdir -p /opt/data/docker/portainer2.9
sudo mkdir -p /opt/data/docker/postgresql12.8/pgdata
sudo mkdir -p /opt/data/docker/postgresql14.6/pgdata
sudo mkdir -p /opt/data/docker/openfortivpn22.04

sudo chown -R ubuntu:ubuntu /opt/data/docker
sudo chmod 777 /opt/data/docker

##### CUSTOMIZE ~/.profile #####
echo '' >>~/.profile
echo '### Docker ###
export DOCKER_CLIENT_TIMEOUT=300
export COMPOSE_HTTP_TIMEOUT=300' >>~/.profile

##### CONFIGURE DOCKER #####
## Create Folder Docker
sudo mkdir -p /opt/data/lib/docker
## Symlink Folder Docker
sudo ln -sf /opt/data/lib/docker /var/lib/docker

sudo usermod -a -G docker ubuntu

sudo ln -snf $DOCKERR_PATH /usr/bin/dock
sudo ln -snf $DOCKER_COMPOSE_PATH /usr/bin/dcomp

sudo systemctl enable docker.service
sudo systemctl start docker.service
