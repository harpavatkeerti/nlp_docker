# Each instruction in this file generates a new layer that gets pushed to your local image cache
 
# Lines preceeded by # are regarded as comments and ignored
 
#
# The line below states we will base our new image on the Latest Official Ubuntu 
# Remove py3 for python 2 image
FROM tensorflow/tensorflow:1.15.0-gpu-py3
#ENV http_proxy http://172.16.117.121:3128
#ENV https_proxy http://172.16.117.121:3128

ARG DEBIAN_FRONTEND=noninteractive

# Identify the maintainer of an image
LABEL maintainer="keert170101031@iitg.ac.in"
LABEL version="0.1"
LABEL description="NLP project libraries"
#
# Update the image to the latest packages
#RUN apt-get update && apt-get upgrade -y
RUN apt-get update
RUN apt-get install gdown
#
RUN apt-get install -y wget vim htop fish datamash graphviz libgraphviz-dev

RUN apt-get install -y libtiff5-dev libjpeg8-dev libopenjp2-7-dev zlib1g-dev \
    libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python3-tk \
    libharfbuzz-dev libfribidi-dev libxcb1-dev

RUN pip install --upgrade pip

RUN pip3 --no-cache-dir install ipython pandas

RUN pip3 --no-cache-dir install docopt joblib natsort scipy

RUN pip3 --no-cache-dir install tqdm keras matplotlib librosa scikit-learn

RUN pip3 --no-cache-dir install dill bleach namedtupled

RUN pip3 --no-cache-dir install PyEMD

RUN pip3 --no-cache-dir install faiss-gpu

RUN pip3 --no-cache-dir install indic-nlp-library

#RUN pip3 --no-cache-dir install pytorch-pretrained-bert==0.6.1 torch==1.0.1.post2 seqeval==0.0.5 nltk

RUN pip3 --no-cache-dir install networkx pathlib pygraphviz

RUN pip3 --no-cache-dir install torch==1.4.0+cu100 torchvision==0.5.0+cu100 -f https://download.pytorch.org/whl/torch_stable.html

RUN pip3 --no-cache-dir install Pillow

RUN pip3 --no-cache-dir install torchvision torchsummary tb-nightly

RUN apt-get install -y git

# 
RUN apt-get install -y python3-venv

# Install locales
RUN apt-get install -y locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8