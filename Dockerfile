FROM nvidia/cuda:9.0-runtime-ubuntu16.04
MAINTAINER timiil@163.com

ENV CUDNN_VERSION 7.0.5.15
ENV TENSORFLOW_VERSION 1.5.0
ENV CUDNN_DEB libcudnn7_$CUDNN_VERSION-1+cuda9.0_amd64.deb

#check the version: https://developer.download.nvidia.cn/compute/machine-learning/repos/ubuntu1604/x86_64/

RUN apt-get update -y \
 && apt-get install -y --no-install-recommends \
 && apt-get install -y nano git curl wget -y \
 && apt-get install -y python3-pip -y \
 && pip3 install tensorflow-gpu==$TENSORFLOW_VERSION \ 
 && wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/$CUDNN_DEB \
 && dpkg -i $CUDNN_DEB \
 && rm $CUDNN_DEB 
