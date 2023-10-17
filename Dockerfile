# FROM nvcr.io/nvidia/pytorch:22.02-py3
FROM pytorch/pytorch:1.12.1-cuda11.3-cudnn8-devel

#RUN apt update && apt install -y \
#    graphviz \
#    libgl1-mesa-dev \
#    && apt clean \
#    && rm -rf /var/lib/apt/lists/*

RUN pip install -U pip \
 && pip install --no-cache-dir \
    matplotlib \
    numpy \
    pandas \
    seaborn \
    shap \
    ipywidgets \
    jupyter-lsp \
    python-language-server[all] \
    ipympl \
    jupyterlab_nvdashboard \
    lckr-jupyterlab-variableinspector \
    perspective-python \
    stickyland

ARG USERNAME=useruser
ARG GROUPNAME=useruser
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID $USERNAME
USER $USERNAME
WORKDIR /home/$USERNAME/
# RUN ln -s /workspace /home/$USERNAME/examples

