FROM gitpod/workspace-base

# Update system, install LaTeX and helper tools
RUN sudo apt-get -q update && \
    sudo apt-get upgrade -y &&\
    sudo apt-get install -yq ack texlive texlive-fonts-extra texlive-xetex && \
    sudo rm -rf /var/lib/apt/lists/*
