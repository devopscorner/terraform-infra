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
export CI_PROJECT_PATH="devopscorner"
export CI_PROJECT_NAME="terraform-infra"

export IMAGE="$CI_REGISTRY/$CI_PROJECT_PATH/$CI_PROJECT_NAME"
export TAG="alpine"

echo "============="
echo "  Login ECR  "
echo "============="
PASSWORD=`aws ecr get-login-password --region ap-southeast-1`
echo $PASSWORD | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.ap-southeast-1.amazonaws.com
echo '- DONE -'
echo ''

echo " Pull Image => $IMAGE:$TAG"
docker pull $IMAGE:$TAG
