# dbdock

## Run your dev dbs and docker via vagrant

- Lets you work on many projects with many different databases with too much OSX craziness
- Uses vagrant to set you up a virtualbox VM with:
  - Ubuntu
  - docker
  - docker-registry
  - any databases you need for local projects

# Prerequisites

- Mac OS X
- VirtualBox
- Vagrant

#Questions

- Why don't you run the databases as docker containers?
  - You certainly can do that and you may prefer it.
  - containerizing the DBs doesn't provide any compelling advantage I can see so I just run them directly in the host OS. It keeps things just a little bit simpler.
  - When I test my apps deployed in docker, I hook them up to containerized DBs, but for local development, I just point my app server at the dbdock host-only IP address and I'm done.
