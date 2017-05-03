FROM scratch

MAINTAINER Siarhei Beliakou (sbeliakou@gmail.com)
ADD   centos7.tar.xz /

RUN   yum install -y epel-release && \
      yum update -y && \
      yum clean all

LABEL architecture="amd64" \
      OS="CentOS" \
      RELEASE="7.3.1611" \
      License=GPLv2 \
      maintainer="Siarhei Beliakou (sbeliakou@gmail.com)"

# Default command 
CMD ["/bin/bash"]

