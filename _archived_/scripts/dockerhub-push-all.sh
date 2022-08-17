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

login_docker() {
  echo '==================='
  echo '  Login DockerHub  '
  echo '==================='
  echo ${DOCKERHUB_PASSWORD} | docker login --username ${DOCKERHUB_USERNAME} --password-stdin
  echo '- DONE -'
  echo ''
}

docker_push() {
  export TAGS_ID=$1
  IMAGES=`docker images --format "{{.Repository}}:{{.Tag}}" | grep $IMAGE:${TAGS_ID}`
  for IMG in $IMAGES; do
    echo "Docker Push => $IMG"
    echo ">> docker push $IMG"
    docker push $IMG
    echo '- DONE -'
    echo ''
  done
}

main() {
  login_docker
  docker_push alpine
  docker_push ubuntu
  docker_push codebuild
  echo ''
  echo '-- ALL DONE --'
}

### START HERE ###
main $@
