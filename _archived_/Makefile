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

IMAGE          = $(CI_REGISTRY)/${CI_PROJECT_PATH}/${CI_PROJECT_NAME}
DIR            = $(shell pwd)
VERSION       ?= 1.3.0

BASE_IMAGE     = alpine
BASE_VERSION   = 3.16

# =============== #
#   GET MODULES   #
# =============== #
.PHONY: sub-officials sub-community sub-all
sub-officials:
	@echo "=============================================="
	@echo " Task      : Get Official Submodules "
	@echo " Date/Time : `date`"
	@echo "=============================================="
	@mkdir -p $(TF_MODULES)/officials
	@cd $(PATH_APP) && ./get-officials.sh

sub-community:
	@echo "=============================================="
	@echo " Task      : Get Community Submodules "
	@echo " Date/Time : `date`"
	@echo "=============================================="
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
	@echo "=============================================="
	@echo " Task      : Get CodeBuild Modules "
	@echo " Date/Time : `date`"
	@echo "=============================================="
	@./get-modules-codebuild.sh

# ==================== #
#   CLONE REPOSITORY   #
# ==================== #
.PHONY: git-clone
git-clone:
	@echo "=============================================="
	@echo " Task      : Clone Repository Sources "
	@echo " Date/Time : `date`"
	@echo "=============================================="
	@./git-clone.sh $(SOURCE) $(TARGET)
	@echo '- DONE -'

# ============================= #
#   BUILD CONTAINER TERRAFORM   #
# ============================= #
.PHONY: build-tf-infra
build-tf-infra:
	@echo "=============================================="
	@echo " Task      : Create Container Image Terraform "
	@echo " Date/Time : `date`"
	@echo "=============================================="
	@cd ${PATH_DOCKER} && ./ecr-build-alpine.sh $(ARGS) $(CI_PATH)
	@echo '- DONE -'

# ============================ #
#   TAGS CONTAINER TERRAFORM   #
# ============================ #
.PHONY: tag-tf-infra
tag-tf-infra:
	@echo "=========================================="
	@echo " Task      : Set Tags Image Terraform "
	@echo " Date/Time : `date`"
	@echo "=========================================="
	@cd ${PATH_DOCKER} && ./ecr-tag-alpine.sh $(ARGS) $(CI_PATH)
	@echo '- DONE -'

# ============================ #
#   PUSH CONTAINER TERRAFORM   #
# ============================ #
.PHONY: push-tf-infra
push-tf-infra:
	@echo "=============================================="
	@echo " Task      : Push Container Image Terraform "
	@echo " Date/Time : `date`"
	@echo "=============================================="
	@cd ${PATH_DOCKER} && ./ecr-push-alpine.sh $(ARGS) $(CI_PATH)
	@echo '- DONE -'

# ============================ #
#   PULL CONTAINER TERRAFORM   #
# ============================ #
.PHONY: pull-tf-infra
pull-tf-infra:
	@echo "=============================================="
	@echo " Task      : Pull Container Image Terraform "
	@echo " Date/Time : `date`"
	@echo "=============================================="
	@cd ${PATH_DOCKER} && ./ecr-pull-alpine.sh $(ARGS) $(CI_PATH)
	@echo '- DONE -'

# =========================== #
#   PROVISIONING INFRA CORE   #
# =========================== #
.PHONY: tf-core-init tf-core-create-workspace tf-core-select-workspace tf-core-plan tf-core-apply
tf-core-init:
	@echo "=============================================="
	@echo " Task      : Terraform Init "
	@echo " Date/Time : `date`"
	@echo "=============================================="
	@cd $(TF_CORE) && terraform init $(ARGS)
	@echo '- DONE -'
tf-core-create-workspace:
	@echo "=============================================="
	@echo " Task      : Terraform Create Workspace "
	@echo " Date/Time : `date`"
	@echo "=============================================="
	@cd $(TF_CORE) && terraform workspace new $(ARGS)
	@echo '- DONE -'
tf-core-select-workspace:
	@echo "=============================================="
	@echo " Task      : Terraform Select Workspace "
	@echo " Date/Time : `date`"
	@echo "=============================================="
	@cd $(TF_CORE) && terraform workspace select $(ARGS)
	@echo '- DONE -'
tf-core-plan:
	@echo "=============================================="
	@echo " Task      : Terraform Plan Provisioning "
	@echo " Date/Time : `date`"
	@echo "=============================================="
	@cd $(TF_CORE) && terraform plan $(ARGS)
	@echo '- DONE -'
tf-core-apply:
	@echo "=============================================="
	@echo " Task      : Provisioning Terraform "
	@echo " Date/Time : `date`"
	@echo "=============================================="
	@cd $(TF_CORE) && terraform apply -auto-approve
	@echo '- DONE -'

# ================================ #
#   PROVISIONING RESOURCES INFRA   #
# ================================ #
.PHONY: tf-infra-init tf-infra-create-workspace tf-infra-select-workspace tf-infra-plan tf-infra-apply tf-infra-resource
tf-infra-init:
	@echo "=============================================="
	@echo " Task      : Terraform Init "
	@echo " Date/Time : `date`"
	@echo "=============================================="
	@cd $(TF_RESOURCES)/$(INFRA_RESOURCE) && terraform init $(ARGS)
	@echo '- DONE -'
tf-infra-create-workspace:
	@echo "=============================================="
	@echo " Task      : Terraform Create Workspace "
	@echo " Date/Time : `date`"
	@echo "=============================================="
	@cd $(TF_RESOURCES)/$(INFRA_RESOURCE) && terraform workspace new $(ARGS)
	@echo '- DONE -'
tf-infra-select-workspace:
	@echo "=============================================="
	@echo " Task      : Terraform Select Workspace "
	@echo " Date/Time : `date`"
	@echo "=============================================="
	@cd $(TF_RESOURCES)/$(INFRA_RESOURCE) && terraform workspace select $(ARGS)
	@echo '- DONE -'
tf-infra-plan:
	@echo "=============================================="
	@echo " Task      : Terraform Plan Provisioning "
	@echo " Date/Time : `date`"
	@echo "=============================================="
	@cd $(TF_RESOURCES)/$(INFRA_RESOURCE) && terraform plan $(ARGS)
	@echo '- DONE -'
tf-infra-apply:
	@echo "=============================================="
	@echo " Task      : Provisioning Terraform "
	@echo " Date/Time : `date`"
	@echo "=============================================="
	@cd $(TF_RESOURCES)/$(INFRA_RESOURCE) && terraform apply -auto-approve $(ARGS)
	@echo '- DONE -'

# =============================== #
#   PROVISIONING SPESIFIC INFRA   #
# =============================== #
.PHONY: tf-infra-resource
tf-infra-resource:
	@echo "=============================================="
	@echo " Task      : Terraform Command $(ARGS)"
	@echo " Date/Time : `date`"
	@echo "=============================================="
	@cd $(TF_RESOURCES)/$(INFRA_RESOURCE) && terraform $(ARGS)
	@echo '- DONE -'
