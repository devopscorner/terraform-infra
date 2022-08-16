#!/usr/bin/env sh
# -----------------------------------------------------------------------------
#  Docker Push Container (DockerHub)
# -----------------------------------------------------------------------------
#  Author     : Dwi Fahni Denni
#  License    : Apache v2
# -----------------------------------------------------------------------------
set -e

# export CI_REGISTRY="docker.com"
# export CI_ECR_PATH="devopscorner/terraform-infra"

# export IMAGE="$CI_REGISTRY/$CI_ECR_PATH"
export IMAGE=$4

docker_build() {
  export TAGS_ID=$1
  export FILE=$2
  export CUSTOM_TAGS=$3

  if [ "$CUSTOM_TAGS" = "" ]; then
    echo "Build Image => $IMAGE:${TAGS_ID}"
    docker build -t $IMAGE:${TAGS_ID} -f $FILE .
  else
    echo "Build Image => $IMAGE:${CUSTOM_TAGS}"
    docker build -t $IMAGE:${CUSTOM_TAGS} -f $FILE .
  fi
}

main() {
  # docker_build alpine Dockerfile.alpine devopscorner/terraform-infra
  # docker_build ubuntu Dockerfile.ubuntu devopscorner/terraform-infra
  # docker_build codebuild Dockerfile.codebuild devopscorner/terraform-infra
  docker_build $1 $2 $3 $4
  echo ''
  echo '-- ALL DONE --'
}

### START HERE ###
main $1 $2 $3 $4
