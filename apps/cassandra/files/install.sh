#!/usr/bin/env bash
#===============================================================================
#          FILE: install.sh
#        AUTHOR: Aleksandr Kukhar (kyxap), kyxap@kyxap.pro
#       COMPANY: Fasten.com
#  ORGANIZATION: Operations
#       CREATED: 01/14/17 19:59
#===============================================================================
set -o pipefail
set -eux

yum install -yy yum-utils psmisc procps util-linux xfsprogs java-1.8.0-openjdk-devel

yum-config-manager --enable epel

yum remove -yy java-1.7.0

rpm --import http://rpm.datastax.com/rpm/repo_key
yum-config-manager --add-repo http://rpm.datastax.com/datastax-ddc/3.9
yum-config-manager --enable datastax-ddc
yum install -yy datastax-ddc jemalloc python27-pip
pip install cassandra-driver
chkconfig cassandra on
service cassandra start

