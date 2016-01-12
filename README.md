# remcam-gensim-jupyter
Gensim basic Ubuntu 15.10

For a slightly smaller image, change to:
FROM phusion/baseimage

For all of these gensim docker containers:
Build with 
"docker build -t gensim . " (from the directory with the dockerfile)
To run
"docker run -ti --rm --name gensim gensim /bin/bash"
When you're at the terminal prompt
"cd gensim"
then run something such as "python3 setup.py test"

