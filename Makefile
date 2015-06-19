.DEFAULT_GOAL:=test

REPO:=esselius/establish
TAG:=$(shell git rev-parse --short HEAD)
IMAGE:="$(REPO):$(TAG)"

ifndef CIRCLECI
BUILD_RM:=--force-rm
RUN_RM:=--rm
endif

Gemfile.lock: Gemfile
	docker run $(RUN_RM) -v $(CURDIR):/app ruby:2.2 bundle --gemfile /app/Gemfile

bundle: Gemfile.lock

$(HOME)/.dockercfg:
ifndef DOCKER_EMAIL
$(error Cannot login to Docker Hub without DOCKER_EMAIL set!)
endif
ifndef DOCKER_USER
$(error Cannot login to Docker Hub without DOCKER_USER set!)
endif
ifndef DOCKER_PASS
$(error Cannot login to Docker Hub without DOCKER_PASS set!)
endif
	@echo docker login -e DOCKER_EMAIL -u DOCKER_USER -p DOCKER_PASS
	@docker login -e $(DOCKER_EMAIL) -u $(DOCKER_USER) -p $(DOCKER_PASS)

login: $(HOME)/.dockercfg

build: bundle
	docker build $(BUILD_RM) -t $(IMAGE) .

push: build
	docker push $(IMAGE)

deploy: login push

test: build
	docker run $(RUN_RM) --net=none $(IMAGE) test

test-style: build
	docker run $(RUN_RM) --net=none -t $(IMAGE) test-style

test-full: test test-style
