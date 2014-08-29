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


    echo 10.9.8.50 dbdock | sudo tee -a /etc/hosts
    export DOCKER_HOST=tcp://dbdock:2375

#Questions

- Why don't you run the databases as docker containers?
  - You certainly can do that and you may prefer it.
  - Containerizing the DBs doesn't provide any compelling advantage I can see so I just run them directly in the host OS. It keeps things just a little bit simpler.
  - When I test my apps deployed in docker, I hook them up to containerized DBs, but for local development, I just point my app server at the dbdock host-only IP address and I'm done.
- Is it secure?
  - I think it's reasonably secure since the host is behind the virtualbox NAT network
  - The DBs and docker are only accessible via the virtualbox host-only network.
  - That said, this is intended for non-sensitive, non-critical development/throwaway data. Don't put production data in here.
- Why does the `Vagrantfile` have a hard-coded IP address?
  - That's just the address range I like to use on my virtualbox host-only network, and I prefer static IPs over DHCP. I also add a line to my `/etc/hosts` on my OSX machine so I can access the VM via the hostname `dbdock`.
