FROM concourse/buildroot:curl

ENV BOSH_CLI_VERSION "2.0.16"

ADD assets/ /opt/resource/
RUN chmod +x /opt/resource/*

RUN curl -L "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-${BOSH_CLI_VERSION}-darwin-amd64" > /tmp/bosh-cli \
  && chmod +x /tmp/bosh-cli \
  && mv /tmp/bosh-cli /usr/local/bin/bosh
