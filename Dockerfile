FROM tensorflow/tensorflow:latest-gpu

RUN apt-get update
RUN apt-get install git cmake automake autoconf -y
WORKDIR /notebooks
RUN git clone https://github.com/fchollet/keras
RUN git clone https://github.com/pytorch/pytorch
RUN pip install ipyparallel
RUN ipcluster nbextension enable
COPY startup.sh /tmp/
CMD ["bash","/tmp/startup.sh", "&"]
