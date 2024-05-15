FROM cschranz/gpu-jupyter:v1.5_cuda-12.0_ubuntu-22.04_python-only

# Configure environment
ENV DOCKER_IMAGE_NAME='datascience-env-gpu'
ENV VERSION='2024-05-15' 

# Install Python packages
ADD requirements.txt /
RUN pip install -r /requirements.txt


USER root

RUN apt update && \
    apt install -y r-base 

# Install R packages
ADD install_r_packages.R /
RUN Rscript /install_r_packages.R

USER jovyan


RUN echo "alias jl='jupyter server list'" >> ~/.bashrc