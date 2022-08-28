# Terraform Infra - DockerHub

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
  export IMAGE="devopscorner/terraform-infra"
  export TAG="latest"
  ```

- Execute Build Image

  - Alpine

    ```
    docker build -f Dockerfile.alpine -t $IMAGE:alpine .

    -- or --

    # default: 3.16
    ./dockerhub-build.sh alpine Dockerfile ${ALPINE_VERSION}
    ./dockerhub-build.sh alpine Dockerfile.alpine 3.16
    ```

  - Ubuntu

    ```
    docker build -f Dockerfile.ubuntu -t $IMAGE:ubuntu .

    -- or --

    # default: 22.04
    ./dockerhub-build.sh ubuntu Dockerfile.ubuntu ${UBUNTU_VERSION}
    ./dockerhub-build.sh ubuntu Dockerfile.ubuntu 22.04
    ```

  - CodeBuild

    ```
    docker build -f Dockerfile.codebuild -t $IMAGE:codebuild .

    -- or --

    # default: 4.0
    ./dockerhub-build.sh codebuild Dockerfile.codebuild ${CODEBUILD_VERSION}
    ./dockerhub-build.sh codebuild Dockerfile.codebuild 4.0
    ```

## Push Image to DockerHub

- Login to your DockerHub Account

- Add Environment Variable

  ```
  export DOCKERHUB_USERNAME=[YOUR_DOCKERHUB_USERNAME]
  export DOCKERHUB_PASSWORD=[YOUR_DOCKERHUB_PASSWORD_OR_PERSONAL_TOKEN]
  ```

- Create Tags Image

  - Alpine

    ```
    docker tag ${IMAGE}:alpine ${IMAGE}:alpine-latest
    docker tag ${IMAGE}:alpine ${IMAGE}:alpine-3.16
    ```

  - Ubuntu

    ```
    docker tag ${IMAGE}:ubuntu ${IMAGE}:ubuntu-latest
    docker tag ${IMAGE}:ubuntu ${IMAGE}:ubuntu-22.04
    ```

  - CodeBuild

    ```
    docker tag ${IMAGE}:codebuild ${IMAGE}:latest
    docker tag ${IMAGE}:codebuild ${IMAGE}:codebuild-latest
    docker tag ${IMAGE}:codebuild ${IMAGE}:codebuild-4.0
    ```

- Create Image Tags for Automation

  - Alpine

    ```
    # default: 3.16
    ./dockerhub-tag.sh alpine ${ALPINE_VERSION}
    ```

  - Ubuntu

    ```
    # default: 22.04
    ./dockerhub-tag.sh ubuntu ${UBUNTU_VERSION}
    ```

  - CodeBuild

    ```
    # default: 4.0
    ./dockerhub-tag.sh codebuild ${CODEBUILD_VERSION}
    ```

- Push Image to **DockerHub** with Tags

  - Alpine

    ```
    docker push devopscorner/terraform-infra:alpine
    docker push devopscorner/terraform-infra:alpine-latest
    docker push devopscorner/terraform-infra:alpine-3.16
    docker push devopscorner/terraform-infra:alpine-nginx-1.23

    -- or --

    ./dockerhub-push.sh alpine CI_PATH="devopscorner/terraform-infra"
    ```

  - Ubuntu

    ```
    docker push devopscorner/terraform-infra:ubuntu
    docker push devopscorner/terraform-infra:ubuntu-latest
    docker push devopscorner/terraform-infra:ubuntu-22.04
    docker push devopscorner/terraform-infra:ubuntu-nginx-1.23

    -- or --

    ./dockerhub-push.sh ubuntu CI_PATH="devopscorner/terraform-infra"
    ```

  - CodeBuild

    ```
    docker push devopscorner/terraform-infra:latest
    docker push devopscorner/terraform-infra:codebuild
    docker push devopscorner/terraform-infra:codebuild-latest
    docker push devopscorner/terraform-infra:codebuild-2.0
    docker push devopscorner/terraform-infra:codebuild-3.0
    docker push devopscorner/terraform-infra:codebuild-4.0

    -- or --

    ./dockerhub-push.sh codebuild CI_PATH="devopscorner/terraform-infra"
    ```
