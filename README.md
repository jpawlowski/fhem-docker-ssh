# FHEM SSH container

This Docker container wraps connectivity towards the plaintext telnet connectivity of [FHEM Home Automation server](https://fhem.de/).

## Installation

1. Add your own user SSH public keys to the ./config/authorized_keys file.

2. Set appropriate environment variables to configure target server.
Example to run directly:

``
docker run -d -P -e FHEM_HOST=fhem -e FHEM_PORT=7072 -e FHEM_PASSWORD=mysecretpassword
``

The environment variable FHEM_PASSWORD may be optional, depending if you had protected your FHEM telnet device with a password.

To start as a stack using docker-compose, see docker-compose.yml example file.
Start the stack using this command:

``
docker-compose up -d
``

## Pre-Built on Docker Hub

https://hub.docker.com/r/jpsn/fhem-ssh/

``
docker pull jpsn/fhem-ssh
``

## License
See LICENSE file.
