APP  ?= $(APP_NAME)
ARGS 	= $1

CD  ?= [ -d ${PWD}/apps/${APP} ] && cd ${PWD}/apps/${APP}

.PHONY: all help install build validate debug

all: help

help:
	@echo TODO

build:
	@${CD} && packer build \
		${APP}.json ${ARGS}

validate:
	@${CD} && packer validate \
		${APP}.json ${ARGS}

debug:
	@${CD} && packer build -debug \
		${APP}.json ${ARGS}

docker:
	@${CD} && docker run -it --rm -v ${PWD}/apps/${APP}/files:/opt/scripts amazonlinux /bin/bash -c /opt/scripts/install.sh

docker-console:
	@${CD} && docker run -it --rm -v ${PWD}/apps/${APP}/files:/opt/scripts amazonlinux /bin/bash -l
