FROM sbeliakou/centos:6.7

MAINTAINER Siarhei Beliakou (sbeliakou@gmail.com)

# Installing Python 2.7
RUN yum install -y https://centos6.iuscommunity.org/ius-release.rpm && \
    yum install -y python27 python27-devel python27-setuptools python27-pip && \
    yum clean all && \
    ln -sfn /usr/bin/python2.7 /usr/local/bin/python && \
    alternatives --install /usr/bin/easy_install easy_install /usr/bin/easy_install-2.7 0 && \
    alternatives --install /usr/bin/pip pip /usr/bin/pip2.7 0 && \
    pip --no-cache-dir install -U pip setuptools requests

# Install Ansible 2.0.2.0
RUN yum erase -y python-crypto python-crypto2.6 python-paramiko PyYAML python-jinja2 gmp-devel && \
    yum install -y libffi-devel openssl-devel gcc && \
    yum clean all && \
    pip --no-cache-dir install -U pycrypto pyyaml Jinja2 && \
    pip --no-cache-dir install ansible==2.0.2.0

LABEL PYTHON="2.7.11" \
      Ansible="2.0.2.0"

# Default command 
CMD ["/bin/bash"]
