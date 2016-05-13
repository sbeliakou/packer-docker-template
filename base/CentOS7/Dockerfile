FROM sbeliakou/centos:7.2

MAINTAINER Siarhei Beliakou (sbeliakou@gmail.com)

# Installing Python 2.7
RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm && \
    yum install -y python-setuptools python-pip python-devel && \
    yum clean all && \
    pip --no-cache-dir install -U pip setuptools requests

# Install Ansible 2.0.2.0
RUN yum erase -y python-crypto python-crypto2.6 python-paramiko PyYAML python-jinja2 gmp-devel && \
    yum install -y libffi-devel openssl-devel gcc && \
    yum clean all && \
    pip --no-cache-dir install -U pycrypto pyyaml Jinja2 && \
    pip --no-cache-dir install ansible==2.0.2.0

LABEL PYTHON="2.7.8" \
      Ansible="2.0.2.0"

# Default command 
CMD ["/bin/bash"]
