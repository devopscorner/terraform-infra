# Terraform Infra - Amazon ECR (Elastic Container Registry)

![all contributors](https://img.shields.io/github/contributors/devopscorner/terraform-infra)
![tags](https://img.shields.io/github/v/tag/devopscorner/terraform-infra?sort=semver)
[![docker pulls](https://img.shields.io/docker/pulls/devopscorner/terraform-infra.svg)](https://hub.docker.com/r/devopscorner/terraform-infra/)
![download all](https://img.shields.io/github/downloads/devopscorner/terraform-infra/total.svg)
![view](https://views.whatilearened.today/views/github/devopscorner/terraform-infra.svg)
![clone](https://img.shields.io/badge/dynamic/json?color=success&label=clone&query=count&url=https://github.com/devopscorner/terraform-infra/blob/master/clone.json?raw=True&logo=github)
![issues](https://img.shields.io/github/issues/devopscorner/terraform-infra)
![pull requests](https://img.shields.io/github/issues-pr/devopscorner/terraform-infra)
![forks](https://img.shields.io/github/forks/devopscorner/terraform-infra)
![stars](https://img.shields.io/github/stars/devopscorner/terraform-infra)
[![license](https://img.shields.io/github/license/devopscorner/terraform-infra)](https://img.shields.io/github/license/devopscorner/terraform-infra)

Production Grade Terraform for Provisioning Infrastructure

---

## Prerequirements

- Docker (`docker`)
- Docker Compose (`docker-compose`)

## Build Container Image

- Clone this repository

  ```
  git clone https://github.com/devopscorner/terraform-infra.git
  ```

- Replace "YOUR_AWS_ACCOUNT" with your AWS ACCOUNT ID

  ```
  find ./ -type f -exec sed -i 's/YOUR_AWS_ACCOUNT/123456789012/g' {} \;
  ```

- Set Environment Variable

  ```
  export ALPINE_VERSION=3.16
  export UBUNTU_VERSION=22.04
  export CODEBUILD_VERSION=4.0

  export PATH_COMPOSE="compose"
  export PATH_DOCKER="$PATH_COMPOSE/docker"
  export BASE_IMAGE="alpine"  ## alpine | ubuntu | codebuild
  export IMAGE="YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra"
  export TAG="latest"
  ```

- Execute Build Image

  - Alpine

    ```
    docker build -f Dockerfile -t $IMAGE:alpine .

    -- or --

    # default: 3.16
    ./ecr-build.sh YOUR_AWS_ACCOUNT alpine Dockerfile ${ALPINE_VERSION}
    ./ecr-build.sh YOUR_AWS_ACCOUNT alpine Dockerfile.alpine 3.16

    -- or --

    # default: 3.16
    make build-tf-alpine ARGS=YOUR_AWS_ACCOUNT CI_PATH=devopscorner/terraform-infra
    ```

  - Ubuntu

    ```
    docker build -f Dockerfile -t $IMAGE:ubuntu .

    -- or --

    # default: 22.04
    ./ecr-build.sh YOUR_AWS_ACCOUNT ubuntu Dockerfile.ubuntu ${UBUNTU_VERSION}
    ./ecr-build.sh YOUR_AWS_ACCOUNT ubuntu Dockerfile.ubuntu 22.04

    -- or --

    # default: 22.04
    make build-tf-ubuntu ARGS=YOUR_AWS_ACCOUNT CI_PATH=devopscorner/terraform-infra
    ```

  - CodeBuild

    ```
    docker build -f Dockerfile -t $IMAGE:codebuild .

    -- or --

    # default: 4.0
    ./ecr-build.sh YOUR_AWS_ACCOUNT codebuild Dockerfile ${CODEBUILD_VERSION}
    ./ecr-build.sh YOUR_AWS_ACCOUNT codebuild Dockerfile.codebuild 4.0

    -- or --

    # default: 4.0
    make build-tf-codebuild ARGS=YOUR_AWS_ACCOUNT CI_PATH=devopscorner/terraform-infra
    ```

## Push Image to Amazon ECR (Elastic Container Registry)

- Create Image Tags

  - Alpine

    ```
    # default: alpine-latest
    docker tag YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:alpine YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:alpine-latest

    # version: 3.16
    docker tag YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:alpine YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:alpine-3.16
    ```

  - Ubuntu

    ```
    # default: ubuntu-latest
    docker tag YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:ubuntu YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:ubuntu-latest

    # version: 22.04
    docker tag YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:ubuntu YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:ubuntu-22.04
    ```

  - CodeBuild

    ```
    # default: latest
    docker tag YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:codebuild YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:latest

    # version: codebuild-latest
    docker tag YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:codebuild YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:codebuild-latest

    # version: 4.0
    docker tag YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:codebuild YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:codebuild-4.0
    ```

- Create Image Tags for Automation

  - Alpine

    ```
    # default: 3.16
    ./ecr-tag.sh ARGS=YOUR_AWS_ACCOUNT alpine ${ALPINE_VERSION} CI_PATH=devopscorner/terraform-infra

    -- or --

    make tag-tf-alpine ARGS=YOUR_AWS_ACCOUNT CI_PATH=devopscorner/terraform-infra
    ```

  - Ubuntu

    ```
    # default: 22.04
    ./ecr-tag.sh ARGS=YOUR_AWS_ACCOUNT ubuntu ${UBUNTU_VERSION} CI_PATH=devopscorner/terraform-infra

    -- or --

    make tag-tf-ubuntu ARGS=YOUR_AWS_ACCOUNT CI_PATH=devopscorner/terraform-infra
    ```

  - CodeBuild

    ```
    # default: 4.0
    ./ecr-tag.sh ARGS=YOUR_AWS_ACCOUNT codebuild ${CODEBUILD_VERSION} CI_PATH=devopscorner/terraform-infra

    -- or --

    make tag-tf-codebuild ARGS=YOUR_AWS_ACCOUNT CI_PATH=devopscorner/terraform-infra
    ```

- Push Image to **Amazon ECR** with Tags

  - Alpine

    ```
    docker push YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:alpine
    docker push YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:alpine-latest
    docker push YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:alpine-3.16

    -- or --

    ./ecr-push.sh ARGS=YOUR_AWS_ACCOUNT alpine CI_PATH="devopscorner/terraform-infra"

    -- or --

    make push-tf-alpine ARGS=YOUR_AWS_ACCOUNT CI_PATH="devopscorner/terraform-infra"
    ```

  - Ubuntu

    ```
    docker push YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:ubuntu
    docker push YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:ubuntu-latest
    docker push YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:ubuntu-22.04

    -- or --

    ./ecr-push.sh ARGS=YOUR_AWS_ACCOUNT ubuntu CI_PATH="devopscorner/terraform-infra"

    -- or --

    make push-tf-ubuntu ARGS=YOUR_AWS_ACCOUNT CI_PATH="devopscorner/terraform-infra"
    ```

  - CodeBuild

    ```
    docker push YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:codebuild
    docker push YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:latest
    docker push YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:codebuild-latest
    docker push YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:codebuild-4.0

    -- or --

    ./ecr-push.sh ARGS=YOUR_AWS_ACCOUNT codebuild CI_PATH="devopscorner/terraform-infra"

    -- or --

    make push-tf-codebuild ARGS=YOUR_AWS_ACCOUNT CI_PATH="devopscorner/terraform-infra"
    ```
