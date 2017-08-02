FROM ubuntu:16.04

MAINTAINER Chris Diehl <chris@thedataguild.com>

RUN apt-get update && apt-get install -y wget bzip2 emacs24 gcc g++ git unzip

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda2-4.4.0-Linux-x86_64.sh && \
    /bin/bash /Anaconda2-4.4.0-Linux-x86_64.sh  -b -p /opt/anaconda && \
    rm /Anaconda2-4.4.0-Linux-x86_64.sh 
ENV PATH /opt/anaconda/bin:$PATH

RUN conda install -c conda-forge line_profiler
RUN pip install -U pip memory_profiler nbdime
RUN nbdime config-git --enable --global

ENTRYPOINT jupyter notebook --no-browser --allow-root --port 8888 --ip=* --NotebookApp.password='sha1:57ac8335652c:17718c796c2e1e614133f521110a5552e12fa817'
