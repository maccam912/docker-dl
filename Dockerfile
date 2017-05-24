FROM tensorflow/tensorflow:latest-gpu

COPY startup.sh /tmp/
CMD ["bash","/tmp/startup.sh", "&"]
