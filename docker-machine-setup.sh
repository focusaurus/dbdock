# need mysql and redis for footprintid
docker run \
  --detach \
  --restart=always \
  --name=mysql \
  --publish=3306:3306 \
  --env=MYSQL_ROOT_PASSWORD=password \
  --volume=/Users/plyons/boot2docker-volume:/volume \
  mysql:5.5

docker run \
  --detach \
  --restart=always \
  --name=redis \
  --publish=6379:6379 \
  redis:2.8

# need couchdb for sparkhelp
docker run \
  --detach \
  --restart=always \
  --name=couchdb \
  --publish=5984:5984 \
  --env=COUCHDB_PASS=password \
  tutum/couchdb

# need postgresql for mjournal
docker run \
  --detach \
  --restart=always \
  --name postgres \
  --publish=5432:5432 \
  --env=POSTGRES_PASSWORD=password \
  postgres:9.4.1

# need mongodb for carson
docker run \
  --detach \
  --restart=always \
  --name mongodb \
  --publish=27017:27017 \
  --env=MONGODB_PASS=password \
  --volume=/Users/plyons/boot2docker-volume:/volume \
  mongo:2.6.8
