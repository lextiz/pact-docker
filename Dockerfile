FROM ubuntu:16.04

# RUN PACT_VERSION=1.64.0 && apt-get update && apt-get install -y curl && cd / && curl -LO https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v${PACT_VERSION}/pact-${PACT_VERSION}-linux-x86_64.tar.gz && tar xzf pact-${PACT_VERSION}-linux-x86_64.tar.gz && rm -f pact-${PACT_VERSION}-linux-x86_64.tar.gz && apt-get remove -y curl
# Instead of downloading the executables using local patched version, because it has a bugfix for https://github.com/pact-foundation/pact-mock_service/issues/103
COPY ./pact-1.64.0-linux-x86_64.tar.gz /
RUN cd / && tar xzf pact-1.64.0-linux-x86_64.tar.gz && rm -f pact-1.64.0-linux-x86_64.tar.gz

WORKDIR /pact/bin
EXPOSE 8080
ENTRYPOINT ["/bin/bash"]
CMD ["/pact/bin/pact-stub-service", "--help"]