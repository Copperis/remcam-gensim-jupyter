#FROM ubuntu:15.10
FROM phusion/baseimage
#FROM welkineins/ubuntu-xfce-vnc-desktop
MAINTAINER Steph van Schalkwyk <step@remcam.net>

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

# Set the locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

RUN mkdir -p $HOME/gensim
# WORKDIR $HOME/gensim

RUN apt-get update && apt-get install -y wget build-essential python3-dev python3-setuptools python3-numpy python3-scipy python3-pip libatlas-dev libatlas3gf-base 
RUN wget -nv -O /tmp/gensim-0.12.3.tar.gz https://pypi.python.org/packages/source/g/gensim/gensim-0.12.3.tar.gz#md5=9581467d50ec6da0097939464c422d00 \
	&&	tar -xzvf /tmp/gensim-0.12.3.tar.gz -C $HOME/gensim --strip-components=1 \
	&&	cd $HOME/gensim \
	&&	python3 setup.py install


RUN pip3 install jupyter
EXPOSE 8888
CMD ["/bin/bash", "-c", "jupyter notebook"] 
