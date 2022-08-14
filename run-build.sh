#!/usr/bin/env sh
# -----------------------------------------------------------------------------
#  Docker Build, Tag & Push Container for DockerHub
# -----------------------------------------------------------------------------
#  Author     : Dwi Fahni Denni (@zeroc0d3)
#  License    : Apache v2
# -----------------------------------------------------------------------------

docker build -f Dockerfile.alpine -t devopscorner/terraform-infra:alpine . &&\
docker build -f Dockerfile.ubuntu -t devopscorner/terraform-infra:ubuntu . &&\
docker build -f Dockerfile.codebuild -t devopscorner/terraform-infra:codebuild . &&\
./dockerhub-tag-alpine.sh &&\
./dockerhub-tag-ubuntu.sh &&\
./dockerhub-tag-codebuild.sh &&\
./dockerhub-push-alpine.sh &&\
./dockerhub-push-ubuntu.sh &&\
./dockerhub-push-codebuild.sh