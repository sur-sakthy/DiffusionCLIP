FROM anibali/pytorch:2.0.0-cuda11.8-ubuntu22.04
USER root

RUN apt-get update
RUN apt-get install -y python3 make gcc g++

RUN pip install torch torchvision cuda-python cmake pyyaml opencv-python

RUN mkdir -p /clip
WORKDIR /clip
COPY requirements.txt .
RUN pip install -r requirements.txt

RUN pip install git+https://github.com/openai/CLIP.git
