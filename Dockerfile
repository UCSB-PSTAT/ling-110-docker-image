# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

FROM ucsb/ling-194:v20201223.2

LABEL maintainer="Patrick Windmiller <sysadmin@pstat.ucsb.edu>"

USER root

#-- Requirements
RUN apt-get update && apt-get install -y g++ git subversion automake \
libtool zlib1g-dev libicu-dev libboost-all-dev libbz2-dev liblzma-dev \
python-dev graphviz imagemagick make cmake libgoogle-perftools-dev autoconf gawk \
doxygen && rm -rf /var/lib/apt/lists/*

#-- Install SRILM
RUN mkdir /usr/bin/srilm
WORKDIR /usr/bin/srilm
COPY srilm-1.7.3.tar .
RUN tar xvf srilm-1.7.3.tar && sed -i '1iSRILM = /usr/bin/srilm' Makefile && \
make && make World

USER $NB_UID

RUN pip install gensim && \
    pip install timeout-decorator && \
    pip install morfessor && \
    pip install cython && \
    pip install arpa

WORKDIR /home/jovyan/

#-- Export PATHS
RUN export PATH=$PATH:/usr/bin/srilm/bin:/usr/bin/srilm/i686-m64

RUN export LC_NUMERIC=C
