FROM ubuntu:noble-20250404
LABEL maintainer="Erik Ferlanti <eferlanti@tacc.utexas.edu>"

# Update OS / Install tools
RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y fortune cowsay lolcat && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV PATH=/usr/games:${PATH}
ENV LC_ALL=C

ENTRYPOINT [ "/bin/sh", "-c", "fortune | cowsay | lolcat" ]
