FROM ubuntu

MAINTAINER Chris Diehl <chris@thedataguild.com>

RUN apt-get update && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 emacs24 gcc unzip
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda2-2.4.0-Linux-x86_64.sh && \
    /bin/bash /Anaconda2-2.4.0-Linux-x86_64.sh -b -p /opt/conda && \
    rm /Anaconda2-2.4.0-Linux-x86_64.sh && \
    /opt/conda/bin/conda install --yes conda==3.18.3
RUN /opt/conda/bin/conda update --yes anaconda && /opt/conda/bin/conda install --yes seaborn && \
    /opt/conda/bin/conda update --yes numpy && /opt/conda/bin/conda update --yes scipy

ENV PATH /opt/conda/bin:$PATH
RUN pip install -U line-profiler memory_profiler

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8

VOLUME /notebooks
WORKDIR /notebooks

EXPOSE 8888

# You can mount your own SSL certs as necessary here
ENV PEM_FILE /key.pem
# $PASSWORD will get `unset` within notebook.sh, turned into an IPython style hash
ENV PASSWORD Dont make this your default
ENV USE_HTTP 0

ADD notebook.sh /
RUN chmod u+x /notebook.sh

CMD ["/notebook.sh"]
