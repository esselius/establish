.DEFAULT_GOAL:=test

REPO:=esselius/establish
TAG:=$(shell git rev-parse --short HEAD)
IMAGE:="$(REPO):$(TAG)"

Gemfile.lock: Gemfile
	docker run --rm -v $(CURDIR):/app ruby:2.2 bundle --gemfile /app/Gemfile

bundle: Gemfile.lock

build: bundle
	docker build --force-rm -t $(IMAGE) .

push: build
	docker push $(IMAGE)

test: build
	docker run --rm --net=none $(IMAGE) test

test-style: build
	docker run --rm --net=none -t $(IMAGE) test-style

test-full: test test-style
