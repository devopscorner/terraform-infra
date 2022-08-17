#!/usr/bin/env sh
# -----------------------------------------------------------------------------
#  Docker Tag Container (DockerHub)
# -----------------------------------------------------------------------------
#  Author     : Dwi Fahni Denni
#  License    : Apache v2
# -----------------------------------------------------------------------------
set -e

export CI_PROJECT_PATH="devopscorner"
export CI_PROJECT_NAME="terraform-infra"

export IMAGE="$CI_PROJECT_PATH/$CI_PROJECT_NAME"
export CICD_VERSION="1.0.5"
export ALPINE_VERSION="3.16"
export UBUNTU_VERSION="22.04"
export CODEBUILD_VERSION="4.0"

set_tag_alpine() {
  export TAGS_ID=$1
  export BASE_IMAGE="$IMAGE:${TAGS_ID}"
  export COMMIT_HASH=`git log -1 --format=format:"%H"`
  export TAGS="latest \
    ${CICD_VERSION} \
    ${CICD_VERSION}-${TAGS_ID} \
    ${TAGS_ID}-latest \
    ${TAGS_ID}-${ALPINE_VERSION} \
    ${TAGS_ID}-${COMMIT_HASH}"
}

set_tag_ubuntu() {
  export TAGS_ID=$1
  export BASE_IMAGE="$IMAGE:${TAGS_ID}"
  export COMMIT_HASH=`git log -1 --format=format:"%H"`
  export TAGS="${TAGS_ID} \
    ${CICD_VERSION}-${TAGS_ID} \
    ${TAGS_ID}-latest \
    ${TAGS_ID}-${UBUNTU_VERSION} \
    ${TAGS_ID}-${COMMIT_HASH}"
}

set_tag_codebuild() {
  export TAGS_ID=$1
  export BASE_IMAGE="$IMAGE:${TAGS_ID}"
  export COMMIT_HASH=`git log -1 --format=format:"%H"`
  export TAGS="${TAGS_ID} \
    ${TAGS_ID}-latest \
    ${TAGS_ID}-${CODEBUILD_VERSION} \
    ${TAGS_ID}-${COMMIT_HASH}"
}

docker_tag() {
  for TAG in $TAGS; do
    echo "Docker Tags => $IMAGE:$TAG"
    echo ">> docker tag $BASE_IMAGE $IMAGE:$TAG"
    docker tag $BASE_IMAGE $IMAGE:$TAG
    echo '- DONE -'
    echo ''
  done
}

main() {
  set_tag_alpine alpine
  docker_tag

  set_tag_ubuntu ubuntu
  docker_tag

  set_tag_codebuild codebuild
  docker_tag
  echo ''
  echo '-- ALL DONE --'
}

### START HERE ###
main $@
