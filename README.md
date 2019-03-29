# Ruby Pact CLI in a docker container

This docker image contains the Ruby implementations of Pact standalone executables: ```pact-mock-service```, ```pact-stub-service```, ```pact-provider-verifier```, ```pact-broker```, ```pact``` and ```pact-message``` 

# Usage

Any tools from pact standalone package can be used as is via Docker command option, see the [usage documentation](https://github.com/pact-foundation/pact-ruby-standalone/releases).

## Docker compose

For example staring a pact stub service in docker compose would look as following:

```yaml
  my-mock-server:
    image: lextiz/pact-docker:1.64.0-patch-1
    command: /pact/bin/pact-stub-service --host=0.0.0.0 --port=80 /pact/pacts/specific_pact_file.json
    ports:
    - 8888:80
    volumes:
    - ./path/to/pacts/on/host:/pact/pacts
```

# Build

Building the docker image and uploading it to the Docker registry is done as following:

```bash
docker build -t lextiz/pact-docker:1.64.0-patch-1 .
docker login
docker push lextiz/pact-docker:1.64.0-patch-1
```

# Motivation

There are existing docker images with different Pact executables ([1](https://github.com/DiUS/pact_broker-docker),[2](https://github.com/pact-foundation/pact-mock-service-docker),[3](https://github.com/pact-foundation/pact-stub-server)), but they use different Pact implementations and versions. Approach of having all the executables wrapped in a Docker image provides environment where all Pact executables are in sync, and their version needs to be updated once.  

# Known issues

- Patched pact executables, because pact-mock_server has a bugfix for [this issue](https://github.com/pact-foundation/pact-mock_service/issues/103)
- Explicit host definition in docker command is needed due to [this issue](https://github.com/pact-foundation/pact-mock_service/issues/79)
- Ubuntu is too large for a slim image base
