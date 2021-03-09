pwd = $(shell pwd)

SHELL := /bin/bash

ANSIBLE_DIR ?= "${pwd}/ansible"
PACKER_DIR ?= "${pwd}/packer"
TERRAFORM_DIR ?= "${pwd}/terraform"

ansible-galaxy:
	ansible-galaxy collection install \
		community.general
	ansible-galaxy install \
		geerlingguy.certbot

ansible:	
	pushd "${ANSIBLE_DIR}" \
	&& ansible-playbook main.yml

packer:
	pushd "${PACKER_DIR}" \
	&& packer build -var-file=devserver.pkrvars.hcl .

terraform-plan:
	pushd "${TERRAFORM_DIR}" \
	&& terraform plan

terraform: terraform-fmt
	pushd "${TERRAFORM_DIR}" \
	&& terraform apply -auto-approve

terraform-fmt:
	terraform fmt --recursive "${TERRAFORM_DIR}"

format: terraform-fmt

lint:

deploy: packer terraform

.EXPORT_ALL_VARIABLES:

.PHONY: ansible deploy packer terraform terraform-fmt 
