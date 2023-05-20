FROM anibali/pytorch
USER root

RUN apt-get update && apt-get install -y --no-install-recommends python3 python3-virtualenv

RUN pip install torch torchvision cuda-python
RUN pip install cmake

RUN mkdir -p /clip
WORKDIR /clip
COPY requirements.txt .
RUN pip install -r requirements.txt

RUN pip install git+https://github.com/openai/CLIP.git
