FROM tensorflow/tensorflow:1.1.0-gpu

RUN apt-get update
RUN apt-get install git cmake automake autoconf python-tk libffi6 libffi-dev -y
#WORKDIR /notebooks
RUN git clone https://github.com/fchollet/keras
RUN pip install -U keras numpy scipy scikit-learn matplotlib cairocffi editdistance
COPY startup.sh /tmp/
CMD ["bash","/tmp/startup.sh", "&"]
