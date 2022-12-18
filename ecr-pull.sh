#!/usr/bin/env sh
# -----------------------------------------------------------------------------
#  Docker Pull Container
# -----------------------------------------------------------------------------
#  Author     : Dwi Fahni Denni
#  License    : Apache v2
# -----------------------------------------------------------------------------
set -e

export AWS_ACCOUNT_ID=$1
export CI_REGISTRY="${AWS_ACCOUNT_ID}.dkr.ecr.ap-southeast-1.amazonaws.com"
export CI_ECR_PATH=$2

export IMAGE="$CI_REGISTRY/$CI_ECR_PATH"

# export CICD_VERSION="1.23"
# export ALPINE_VERSION="3.16"
# export UBUNTU_VERSION="22.04"
# export CODEBUILD_VERSION="4.0"

login_ecr() {
  echo "============="
  echo "  Login ECR  "
  echo "============="
  PASSWORD=$(aws ecr get-login-password --region ap-southeast-1)
  echo $PASSWORD | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.ap-southeast-1.amazonaws.com
  echo '- DONE -'
  echo ''
}

docker_pull() {
  export TAGS_ID=$2
  echo "Docker Pull => $IMAGE:$TAGS_ID"
  echo ">> docker pull $IMAGE:$TAGS_ID"
  docker pull $IMAGE:$TAGS_ID
  echo '- DONE -'
  echo ''
}

main() {
  login_ecr
  # docker_pull 0987654321 devopscorner/terraform-infra alpine
  # docker_pull 0987654321 devopscorner/terraform-infra ubuntu
  # docker_pull 0987654321 devopscorner/terraform-infra codebuild
  docker_pull ${AWS_ACCOUNT_ID} $2 $3
  echo ''
  echo '-- ALL DONE --'
}

### START HERE ###
main $1 $2 $3

### How to Execute ###
# ./ecr-pull.sh [AWS_ACCOUNT] [ECR_PATH] [alpine|ubuntu|codebuild|version|latest|tags|custom-tags]
