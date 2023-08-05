FROM debian:bookwork-slim

RUN set -ex \
    && sed -i -- 's/# deb-src/deb-src/g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
               build-essential \
               cdbs \
               devscripts \
               equivs \
               fakeroot \
    && apt-get clean \
    && rm -rf /tmp/* /var/tmp/*

RUN curl -sL -o /etc/apt/trusted.gpg.d/morph027-signal-cli.asc https://packaging.gitlab.io/signal-cli/gpg.key
RUN echo "deb https://packaging.gitlab.io/signal-cli signalcli main" | sudo tee /etc/apt/sources.list.d/morph027-signal-cli.list
RUN apt-get update
RUN sudo apt-get install signal-cli-native morph027-keyring
