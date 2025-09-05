FROM ubuntu:latest

# Update system, install LaTeX and helper tools
RUN apt-get --quiet update && \
    apt-get upgrade --yes && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata && \
    ln -fs /usr/share/zoneinfo/America/Phoenix /etc/local && \
    apt-get install --yes --quiet git make texlive texlive-fonts-extra texlive-xetex && \
    rm -rf /var/lib/apt/lists/*
