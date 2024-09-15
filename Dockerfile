FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    gdb \
    valgrind \
    python3 \
    python3-pip \
    openjdk-17-jdk \
    vim \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/python3 /usr/bin/python

RUN pip3 install --no-cache-dir \
    numpy \
    scipy \
    sympy \
    networkx

RUN pip3 install --no-cache-dir online-judge-tools

ENV PATH="/root/.local/bin:${PATH}"


WORKDIR /workspace

CMD ["/bin/bash"]
