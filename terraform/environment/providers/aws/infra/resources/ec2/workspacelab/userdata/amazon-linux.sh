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
sudo curl -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip &&
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin &&
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip &&
    # install terragrunt
    sudo curl -o /usr/local/bin/terragrunt \
        https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 &&
    chmod +x /usr/local/bin/terragrunt &&
    # install packer
    sudo curl -o packer_${PACKER_VERSION}_linux_amd64.zip \
        https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip &&
    unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/local/bin &&
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

# Cleanup Cache
sudo yum autoremove -y

## install tfenv
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >>~/.bash_profile
ln -sf ~/.tfenv/bin/* /usr/local/bin
sudo mkdir -p ~/.local/bin/
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

sudo chown -R ec2-user:ec2-user /opt/data/docker
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

sudo usermod -a -G docker ec2-user

sudo ln -snf $DOCKERR_PATH /usr/bin/dock
sudo ln -snf $DOCKER_COMPOSE_PATH /usr/bin/dcomp

sudo systemctl enable docker.service
sudo systemctl start docker.service
