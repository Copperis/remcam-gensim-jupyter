FROM ubuntu:15.10
MAINTAINER Steph van Schalkwyk <step@remcam.net>
ENV DEBIAN_FRONTEND noninteractive

# Set the locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

RUN mkdir -p /home/gensim_user/gensim
WORKDIR /home/gensim_user

RUN apt-get update && apt-get install -y wget build-essential python3-dev python3-setuptools python3-numpy python3-scipy python3-pip libatlas-dev libatlas3gf-base 
RUN wget -nv -O /tmp/gensim-0.12.3.tar.gz https://pypi.python.org/packages/source/g/gensim/gensim-0.12.3.tar.gz#md5=9581467d50ec6da0097939464c422d00 \
	&&	tar -xzvf /tmp/gensim-0.12.3.tar.gz -C /home/gensim_user/gensim --strip-components=1 \
	&&	cd /home/gensim_user/gensim \
	&&	python3 /home/gensim_user/gensim/setup.py install



