FROM scratch

MAINTAINER Siarhei Beliakou (sbeliakou@gmail.com)
ADD   centos6.tar.xz /

RUN   yum install -y epel-release && \
      yum update -y && \
      yum clean all

LABEL architecture="amd64" \
      OS="CentOS" \
      RELEASE="6.7" \
      License=GPLv2 \
      maintainer="Siarhei Beliakou (sbeliakou@gmail.com)"

# Default command 
CMD ["/bin/bash"]
