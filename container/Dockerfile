FROM ubuntu:16.04

MAINTAINER Chris Diehl <chris@thedataguild.com>

RUN apt-get update && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 emacs24 gcc g++ git unzip
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda2-4.3.1-Linux-x86_64.sh && \
    /bin/bash /Anaconda2-4.3.1-Linux-x86_64.sh  -b -p /opt/conda && \
    rm /Anaconda2-4.3.1-Linux-x86_64.sh && \
    /opt/conda/bin/conda install --yes conda==4.3.14
ENV PATH /opt/conda/bin:$PATH
RUN conda update --yes anaconda && \
    conda update --yes numpy && /opt/conda/bin/conda update --yes scipy
RUN conda install -c conda-forge line_profiler=2.0

RUN pip install -U pip memory_profiler nbdime

RUN nbdime config-git --enable --global

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8

VOLUME /data
WORKDIR /data

# Expose port 8888 for the Jupyter notebook server
EXPOSE 8888

# You can mount your own SSL certs as necessary here
ENV PEM_FILE /key.pem

# $PASSWORD will get reset within notebook.sh and turned into an IPython style hash
ENV PASSWORD Dont make this your default
ENV USE_HTTP 0

ADD notebook.sh /
RUN chmod u+x /notebook.sh

CMD ["/notebook.sh"]
