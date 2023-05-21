FROM anibali/pytorch:1.5.0-cuda10.2-ubuntu18.04
USER root

RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub
RUN apt-get update
RUN apt-get install -y python3 make gcc g++

RUN pip install torch==1.7.1 torchvision==0.8.2 cuda-python cmake pyyaml opencv-python scipy gdown

RUN mkdir -p /clip
WORKDIR /clip
COPY requirements.txt .
RUN pip install -r requirements.txt

RUN pip install git+https://github.com/openai/CLIP.git
