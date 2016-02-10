Packer Docker template
==============

Packer template to make Docker images.

Notes
-----
CentOS 6 x86_64

Packer version: 0.8.6

Usage
=====

Installing Packer
-----------------

Download the latest packer from http://www.packer.io/downloads.html


Building Base Docker Image
--------------------------
```bash
$ docker build .
```


Running Packer
--------------

```bash
$ packer build -var-file=docker-centos-6.7.json docker-centos.json
```
