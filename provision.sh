#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
stop rpcbind
apt-get remove rpcbind
##### mongodb #####
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' \
  > /etc/apt/sources.list.d/mongodb.list

##### mysql #####
debconf-set-selections <<< 'mysql-server mysql-server/root_password password password'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password password'

apt-get --yes update
apt-get --yes install \
  couchdb \
  docker.io \
  mongodb-org \
  mysql-server \
  ntp \
  perl \
  postgresql \
  redis-server
ln -sf /usr/bin/docker.io /usr/local/bin/docker
echo 'DOCKER_OPTS="--ip 0.0.0.0 --host tcp://0.0.0.0:2375"' >> \
  /etc/default/docker.io
service docker.io restart

perl -pi -e 's/127\.0\.0\.1/0.0.0.0/g' \
  /etc/mongod.conf \
  /etc/mysql/my.cnf \
  /etc/redis/redis.conf

restart mongod
restart mysql
service redis-server restart

cat <<EOF > /etc/couchdb/local.ini
[httpd]
bind_address = 0.0.0.0
EOF
restart couchdb

echo "listen_addresses = '0.0.0.0'" >> /etc/postgresql/9.3/main/postgresql.conf
service postgresql restart

mkdir -p /var/local/docker-registry
cat <<EOF > /etc/init/docker-registry.conf
description "docker registry"
start on filesystem and started docker
stop on runlevel [!2345]
respawn
exec /usr/bin/docker run -a stdout --rm --name=docker-registry \
  -v /var/local/docker-registry:/var/local/docker-registry \
  -p 5000:5000 registry
EOF
initctl reload-configuration
start docker-registry
