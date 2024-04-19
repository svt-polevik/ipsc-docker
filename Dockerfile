FROM debian:bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
               build-essential \
               python3 \
    && apt-get clean \
    && rm -rf /tmp/* /var/tmp/*
RUN /bin/bash
