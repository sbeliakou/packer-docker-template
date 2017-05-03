#!/bin/bash

tmpdir=$( mktemp -d )
trap "echo removing ${tmpdir}; rm -rf ${tmpdir}" EXIT
yumconfig=$( mktemp ${tmpdir}/.XXXXXX.yum.conf )

mkdir -m 755 $tmpdir/dev
mknod -m 600 $tmpdir/dev/console c 5 1
mknod -m 600 $tmpdir/dev/initctl p
mknod -m 666 $tmpdir/dev/full c 1 7
mknod -m 666 $tmpdir/dev/null c 1 3
mknod -m 666 $tmpdir/dev/ptmx c 5 2
mknod -m 666 $tmpdir/dev/random c 1 8
mknod -m 666 $tmpdir/dev/tty c 5 0
mknod -m 666 $tmpdir/dev/tty0 c 4 0
mknod -m 666 $tmpdir/dev/urandom c 1 9
mknod -m 666 $tmpdir/dev/zero c 1 5

basearch=x86_64
releasever=7

mkdir -p --mode=0755 $tmpdir/etc
cat > "$yumconfig" <<EOF
[main]
reposdir=
[base]
name=CentOS-base
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os
gpgkey=http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-$releasever
[updates]
name=CentOS-updates
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates
gpgkey=http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-$releasever
EOF

yum -c $yumconfig --installroot=$tmpdir -y install centos-release yum tar procps-ng iproute
yum -c $yumconfig --installroot=$tmpdir -y clean all

echo "NETWORKING=yes" > $tmpdir/etc/sysconfig/network
echo "HOSTNAME=localhost.localdomain" >> $tmpdir/etc/sysconfig/network
touch $tmpdir/etc/resolv.conf
rm -rf $target/var/cache/yum
#mkdir -p --mode=0755 $target/var/cache/yum
rm -rf $tmpdir/usr/{{lib,share}/locale,{lib,lib64}/gconv,bin/localedef,sbin/build-locale-archive}
rm -rf $tmpdir/usr/share/{man,doc,info,gnome/help}
rm -rf $tmpdir/usr/share/cracklib
rm -rf $tmpdir/usr/share/i18n
rm -rf $tmpdir/sbin/sln
rm -rf $tmpdir/etc/ld.so.cache
rm -rf $tmpdir/var/cache/ldconfig/*
tar --numeric-owner -cf - -C $tmpdir . | xz > ${1:-/$(pwd)}/centos7.tar.xz

ls -l ${1:-/$(pwd)}/centos7.tar.xz