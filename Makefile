TRAVIS_BRANCH ?= master
TAG ?= $(subst master,latest,$(TRAVIS_BRANCH))

build:
	docker build --no-cache -t $(DOCKER_USERNAME)/mmdc:build .

deploy:
	docker tag $(DOCKER_USERNAME)/mmdc:build $(DOCKER_USERNAME)/mmdc:$(TAG)
	docker push $(DOCKER_USERNAME)/mmdc:$(TAG)
