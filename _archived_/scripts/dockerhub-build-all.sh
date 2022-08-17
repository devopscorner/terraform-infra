#!/usr/bin/env sh
# -----------------------------------------------------------------------------
#  Docker Push Container (DockerHub)
# -----------------------------------------------------------------------------
#  Author     : Dwi Fahni Denni
#  License    : Apache v2
# -----------------------------------------------------------------------------
set -e

export CI_PROJECT_PATH="devopscorner"
export CI_PROJECT_NAME="terraform-infra"

export IMAGE="$CI_PROJECT_PATH/$CI_PROJECT_NAME"

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
  docker_build alpine Dockerfile.alpine
  docker_build ubuntu Dockerfile.ubuntu
  docker_build codebuild Dockerfile
  docker_build codebuild-4.0 Dockerfile.codebuild
  echo ''
  echo '-- ALL DONE --'
}

### START HERE ###
main $@
