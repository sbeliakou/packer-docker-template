.PHONY: all build

all:
	@echo Usage: make build

build:
	docker run --rm -v $(shell pwd):$(shell pwd) -w $(shell pwd) sbeliakou/centos:7.2 sh $(shell pwd)/bake.sh
	docker build --label RELEASE=$(shell cat .release) -t sbeliakou/centos:$(shell cat .release) .
	rm -f .release centos7.tar.gz