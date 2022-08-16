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
export IMAGE=$2

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
  # docker_push alpine devopscorner/terraform-infra
  # docker_push ubuntu devopscorner/terraform-infra
  # docker_push codebuild devopscorner/terraform-infra
  docker_push $1 $2
  echo ''
  echo '-- ALL DONE --'
}

### START HERE ###
main $1 $2
