FROM jupyter/datascience-notebook

MAINTAINER Chris Diehl <chris@thedataguild.com>

RUN conda install -c conda-forge line_profiler
RUN pip install -U pip memory_profiler nbdime
RUN nbdime config-git --enable --global
