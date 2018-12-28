FROM ubuntu:18.10

RUN apt-get update && \
    apt-get install -y curl jq && \
    apt-get --purge -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["bash","-c"]
