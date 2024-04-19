FROM debian:bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
               build-essential \
               python
    && apt-get clean \
    && rm -rf /tmp/* /var/tmp/*
RUN python
