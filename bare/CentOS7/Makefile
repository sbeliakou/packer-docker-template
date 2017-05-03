.PHONY: all build

all:
	@echo Usage: make build tag=sbeliakou/centos:7.3.1611

build:
	vagrant up; vagrant destroy -f; docker build -t $(tag) .