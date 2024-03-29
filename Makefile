# -----------------------------------------------------------------------------
#  MAKEFILE RUNNING COMMAND
# -----------------------------------------------------------------------------
#  Author     : DevOps Engineer (support@devopscorner.id)
#  License    : Apache v2
# -----------------------------------------------------------------------------
# Notes:
# use [TAB] instead [SPACE]

export PATH_APP=`pwd`
export PATH_WORKSPACE="src"
export PATH_SCRIPT="scripts"
export PATH_COMPOSE="."
export PATH_DOCKER="."
export PROJECT_NAME="terraform-infra"
export TF_PATH="terraform/environment/providers/aws/infra"
export TF_CORE="$(TF_PATH)/core"
export TF_RESOURCES="$(TF_PATH)/resources"
export TF_STATE="$(TF_PATH)/tfstate"

export TF_MODULES="terraform/modules/providers/aws"

export CI_REGISTRY     ?= $(ARGS).dkr.ecr.ap-southeast-1.amazonaws.com
export CI_PROJECT_PATH ?= devopscorner
export CI_PROJECT_NAME ?= terraform-infra

IMAGE   = $(CI_REGISTRY)/${CI_PROJECT_PATH}/${CI_PROJECT_NAME}
DIR     = $(shell pwd)
VERSION ?= 1.3.0

export BASE_IMAGE=alpine
export BASE_VERSION=3.16

export ALPINE_VERSION=3.16
export UBUNTU_VERSION=22.04
export CODEBUILD_VERSION=4.0

# =============== #
#   GET MODULES   #
# =============== #
.PHONY: sub-officials sub-community sub-all codebuild-modules
sub-officials:
	@echo "============================================================"
	@echo " Task      : Get Official Submodules "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@mkdir -p $(TF_MODULES)/officials
	@cd $(PATH_APP) && ./get-officials.sh

sub-community:
	@echo "============================================================"
	@echo " Task      : Get Community Submodules "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@mkdir -p $(TF_MODULES)/community
	@cd $(PATH_APP) && ./get-community.sh

sub-all:
	@make sub-officials
	@echo ''
	@make sub-community
	@echo ''
	@echo '---'
	@echo '- ALL DONE -'

codebuild-modules:
	@echo "============================================================"
	@echo " Task      : Get CodeBuild Modules "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@./get-modules-codebuild.sh

# ==================== #
#   CLONE REPOSITORY   #
# ==================== #
.PHONY: git-clone
git-clone:
	@echo "============================================================"
	@echo " Task      : Clone Repository Sources "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@./git-clone.sh $(SOURCE) $(TARGET)
	@echo '- DONE -'

# ============================= #
#   BUILD CONTAINER TERRAFORM   #
# ============================= #
# ./dockerhub-build.sh Dockerfile [DOCKERHUB_IMAGE_PATH] [alpine|ubuntu|codebuild] [version|latest|tags] [custom-tags]
# ./ecr-build.sh [AWS_ACCOUNT] Dockerfile [ECR_PATH] [alpine|ubuntu|codebuild] [version|latest|tags] [custom-tags]

.PHONY: build-tf-infra build-tf-alpine build-tf-ubuntu build-tf-codebuild
build-tf-infra:
	@echo "============================================================"
	@echo " Task      : Create Container Image Terraform "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@sh ./ecr-build.sh $(ARGS) Dockerfile.alpine $(CI_PATH) alpine ${ALPINE_VERSION}
	@echo '- DONE -'

build-tf-alpine:
	@echo "============================================================"
	@echo " Task      : Create Container Image Terraform Alpine "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@sh ./ecr-build.sh $(ARGS) Dockerfile.alpine $(CI_PATH) alpine ${ALPINE_VERSION}
	@echo '- DONE -'

build-tf-ubuntu:
	@echo "============================================================"
	@echo " Task      : Create Container Image Terraform Ubuntu "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@sh ./ecr-build.sh $(ARGS) Dockerfile.ubuntu $(CI_PATH) ubuntu ${UBUNTU_VERSION}
	@echo '- DONE -'

build-tf-codebuild:
	@echo "============================================================"
	@echo " Task      : Create Container Image Terraform CodeBuild "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@sh ./ecr-build.sh $(ARGS) Dockerfile.codebuild $(CI_PATH) codebuild ${CODEBUILD_VERSION}
	@echo '- DONE -'

# ============================ #
#   TAGS CONTAINER TERRAFORM   #
# ============================ #
# ./dockerhub-tag.sh [DOCKERHUB_IMAGE_PATH] [alpine|ubuntu|codebuild] [version|latest|tags] [custom-tags]
# ./ecr-tag.sh [AWS_ACCOUNT] [ECR_PATH] [alpine|ubuntu|codebuild] [version|latest|tags] [custom-tags]

.PHONY: tag-tf-infra tag-tf-alpine tag-tf-ubuntu tag-tf-codebuild
tag-tf-infra:
	@echo "============================================================"
	@echo " Task      : Set Tags Image Terraform "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@sh ./ecr-tag.sh $(ARGS) $(CI_PATH) alpine ${ALPINE_VERSION}
	@echo '- DONE -'

tag-tf-alpine:
	@echo "============================================================"
	@echo " Task      : Set Tags Image Terraform Alpine "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@sh ./ecr-tag.sh $(ARGS) $(CI_PATH) alpine ${ALPINE_VERSION}
	@echo '- DONE -'

tag-tf-ubuntu:
	@echo "============================================================"
	@echo " Task      : Set Tags Image Terraform Ubuntu "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@sh ./ecr-tag.sh $(ARGS) $(CI_PATH) ubuntu ${UBUNTU_VERSION}
	@echo '- DONE -'

tag-tf-codebuild:
	@echo "============================================================"
	@echo " Task      : Set Tags Image Terraform CodeBuild "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@sh ./ecr-tag.sh $(ARGS) $(CI_PATH) codebuild ${CODEBUILD_VERSION}
	@echo '- DONE -'

# ============================ #
#   PUSH CONTAINER TERRAFORM   #
# ============================ #
# ./dockerhub-tag.sh [DOCKERHUB_IMAGE_PATH] [alpine|ubuntu|codebuild] [version|latest|tags] [custom-tags]
# ./ecr-push.sh [AWS_ACCOUNT] [ECR_PATH] [alpine|ubuntu|codebuild|version|latest|tags|custom-tags]

.PHONY: push-tf-infra push-tf-alpine push-tf-ubuntu push-tf-codebuild
push-tf-infra:
	@echo "============================================================"
	@echo " Task      : Push Container Image Terraform "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@sh ./ecr-push.sh $(ARGS) $(CI_PATH) alpine
	@echo '- DONE -'

push-tf-alpine:
	@echo "============================================================"
	@echo " Task      : Push Container Image Terraform Alpine "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@sh ./ecr-push.sh $(ARGS) $(CI_PATH) alpine
	@echo '- DONE -'

push-tf-ubuntu:
	@echo "============================================================"
	@echo " Task      : Push Container Image Terraform Ubuntu "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@sh ./ecr-push.sh $(ARGS) $(CI_PATH) ubuntu
	@echo '- DONE -'

push-tf-codebuild:
	@echo "============================================================"
	@echo " Task      : Push Container Image Terraform CodeBuild "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@sh ./ecr-push.sh $(ARGS) $(CI_PATH) codebuild
	@echo '- DONE -'

# ============================ #
#   PULL CONTAINER TERRAFORM   #
# ============================ #
# ./ecr-pull.sh [AWS_ACCOUNT] [ECR_PATH] [alpine|ubuntu|codebuild|version|latest|tags|custom-tags]

.PHONY: pull-tf-infra pull-tf-alpine pull-tf-ubuntu pull-tf-codebuild
pull-tf-infra:
	@echo "============================================================"
	@echo " Task      : Pull Container Image Terraform "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@sh ./ecr-pull.sh $(ARGS) $(CI_PATH) alpine
	@echo '- DONE -'

pull-tf-alpine:
	@echo "============================================================"
	@echo " Task      : Pull Container Image Terraform Alpine "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@sh ./ecr-pull.sh $(ARGS) $(CI_PATH) alpine
	@echo '- DONE -'

pull-tf-ubuntu:
	@echo "============================================================"
	@echo " Task      : Pull Container Image Terraform Ubuntu "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@sh ./ecr-pull.sh $(ARGS) $(CI_PATH) ubuntu
	@echo '- DONE -'

pull-tf-codebuild:
	@echo "============================================================"
	@echo " Task      : Pull Container Image Terraform CodeBuild "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@sh ./ecr-pull.sh $(ARGS) $(CI_PATH) codebuild
	@echo '- DONE -'

# =========================== #
#   PROVISIONING INFRA CORE   #
# =========================== #
.PHONY: tf-core-init tf-core-create-workspace tf-core-select-workspace tf-core-plan tf-core-apply
tf-core-init:
	@echo "============================================================"
	@echo " Task      : Terraform Init "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@cd $(TF_CORE) && terraform init $(ARGS)
	@echo '- DONE -'
tf-core-create-workspace:
	@echo "============================================================"
	@echo " Task      : Terraform Create Workspace "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@cd $(TF_CORE) && terraform workspace new $(ARGS)
	@echo '- DONE -'
tf-core-select-workspace:
	@echo "============================================================"
	@echo " Task      : Terraform Select Workspace "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@cd $(TF_CORE) && terraform workspace select $(ARGS)
	@echo '- DONE -'
tf-core-plan:
	@echo "============================================================"
	@echo " Task      : Terraform Plan Provisioning "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@cd $(TF_CORE) && terraform plan $(ARGS)
	@echo '- DONE -'
tf-core-apply:
	@echo "============================================================"
	@echo " Task      : Provisioning Terraform "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@cd $(TF_CORE) && terraform apply -auto-approve
	@echo '- DONE -'

# ================================ #
#   PROVISIONING RESOURCES INFRA   #
# ================================ #
.PHONY: tf-infra-init tf-infra-create-workspace tf-infra-select-workspace tf-infra-plan tf-infra-apply tf-infra-resource
tf-infra-init:
	@echo "============================================================"
	@echo " Task      : Terraform Init "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@cd $(TF_RESOURCES)/$(INFRA_RESOURCES) && terraform init $(ARGS)
	@echo '- DONE -'
tf-infra-create-workspace:
	@echo "============================================================"
	@echo " Task      : Terraform Create Workspace "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@cd $(TF_RESOURCES)/$(INFRA_RESOURCES) && terraform workspace new $(ARGS)
	@echo '- DONE -'
tf-infra-select-workspace:
	@echo "============================================================"
	@echo " Task      : Terraform Select Workspace "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@cd $(TF_RESOURCES)/$(INFRA_RESOURCES) && terraform workspace select $(ARGS)
	@echo '- DONE -'
tf-infra-plan:
	@echo "============================================================"
	@echo " Task      : Terraform Plan Provisioning "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@cd $(TF_RESOURCES)/$(INFRA_RESOURCES) && terraform plan $(ARGS)
	@echo '- DONE -'
tf-infra-apply:
	@echo "============================================================"
	@echo " Task      : Provisioning Terraform "
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@cd $(TF_RESOURCES)/$(INFRA_RESOURCES) && terraform apply -auto-approve $(ARGS)
	@echo '- DONE -'

# =============================== #
#   PROVISIONING SPESIFIC INFRA   #
# =============================== #
.PHONY: tf-infra-resource
tf-infra-resource:
	@echo "============================================================"
	@echo " Task      : Terraform Command $(ARGS)"
	@echo " Date/Time : `date` "
	@echo "============================================================"
	@cd $(TF_RESOURCES)/$(INFRA_RESOURCES) && terraform $(ARGS)
	@echo '- DONE -'
