FROM nvidia/cuda:8.0-cudnn6-devel

# First part from github.com/floydhub/dl-docker

RUN echo -e "\n**********************\nNVIDIA Driver Version\n**********************\n" && \
	cat /proc/driver/nvidia/version && \
	echo -e "\n**********************\nCUDA Version\n**********************\n" && \
	nvcc -V && \
	echo -e "\n\nBuilding your Deep Learning Docker Image...\n"

RUN apt-get update && apt-get install curl -y
RUN echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
RUN cat << EOF
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1

mQINBFdEmzkBEACzj8tMYUau9oFZWNDytcQWazEO6LrTTtdQ98d3JcnVyrpT16yg
I/QfGXA8LuDdKYpUDNjehLtBL3IZp4xe375Jh8v2IA2iQ5RXGN+lgKJ6rNwm15Kr
qYeCZlU9uQVpZuhKLXsWK6PleyQHjslNUN/HtykIlmMz4Nnl3orT7lMI5rsGCmk0
1Kth0DFh8SD9Vn2G4huddwxM8/tYj1QmWPCTgybATNuZ0L60INH8v6+J2jJzViVc
NRnR7mpouGmRy/rcr6eY9QieOwDou116TrVRFfcBRhocCI5b6uCRuhaqZ6Qs28Bx
4t5JVksXJ7fJoTy2B2s/rPx/8j4MDVEdU8b686ZDHbKYjaYBYEfBqePXScp8ndul
XWwS2lcedPihOUl6oQQYy59inWIpxi0agm0MXJAF1Bc3ToSQdHw/p0Y21kYxE2pg
EaUeElVccec5poAaHSPprUeej9bD9oIC4sMCsLs7eCQx2iP+cR7CItz6GQtuZrvS
PnKju1SKl5iwzfDQGpi6u6UAMFmc53EaH05naYDAigCueZ+/2rIaY358bECK6/VR
kyrBqpeq6VkWUeOkt03VqoPzrw4gEzRvfRtLj+D2j/pZCH3vyMYHzbaaXBv6AT0e
RmgtGo9I9BYqKSWlGEF0D+CQ3uZfOyovvrbYqNaHynFBtrx/ZkM82gMA5QARAQAB
tEdCYXplbCBEZXZlbG9wZXIgKEJhemVsIEFQVCByZXBvc2l0b3J5IGtleSkgPGJh
emVsLWRldkBnb29nbGVncm91cHMuY29tPokCPgQTAQIAKAUCV0SbOQIbAwUJA8Jn
AAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQPVkZtEhFfuA+BA/9ErVPkCbr
bwGX6HHY2h9RULnOuBOJKhqDdlAmJ9Bi1TwliG72rXO52mO7WbSJ4Ux+5bbO3kiz
UId6xr6FZmTJiHCY42gwgLOHLIwd6Y7l+2PTyQ0ryL35hiPvlwhcJ4QzfF0/8MTD
vyQaieBKQQkZD+RmXJLmDGmztLhaUw0BTkONfbN0jTdIt7lAmkVZYo8JCoMbCXlk
9kkh6lx9vXZ0JQkfm1gRRWAAShsOHMYZgXsj11Y3C76zxv8jNoT8315Q4bVMKmjr
+bOaR7idiTlxRKl17eRr8qZ1AqJrwywyjFTWQpwHw3uR4iMt+QSgceKiuihpZBpv
mVtNVaMiJTkR63pRmwaGoGov4u3VMBRa6YMQaXQ1UEwrqEH+cyNZgWidlIywpgzD
4hjLYuE/dCvCVT+M32vTQVhNDCwZkmiNeVQE1R/5AdhQLSvBnLGXIfkXnsCl0vFl
oG2brgxIs3TN8oEitIeVWJ+oj5AqTRBeHIZ5MHktF/18AfPNER4UtufGxUWbAtyf
3HtmZZ03XMct52qSaKZbTY1bOmsgy6ba3Kkc9ifjYa9w9FEVysUPmLzy4+l3K5Xw
92iVYLDtCTThhYfbTJ8IWvJGE9hkyYmPF4Q0O3kFQqQmrFVADMyxR0DMIULs8U3k
bKa5K3939aSYXQAdpq6d6T0y2+XdvSHrmVu5Ag0EV0SbOQEQAOef9VQZQ6VfxJVM
i5kcjws/1fprB3Yp8sODL+QyULqbmcJTMr8Tz83OxprCH5Nc7jsw1oqzbNtq+N2p
OnbAL6XFPolQYuOjKlHGzbQvpH8ZSok6AzwrPNq3XwoB0+12A86wlpajUPfvgajN
jmESMchLnIs3qH1j5ayVICr7vH1i1Wem2J+C/z6gIaG4bko0XKAeU6fNYRmuHLHC
iBiKocpn54LmmPL4ifN7Rz1KkCaAKTT8vKtaVh0g1eswb+9W3qldm+nAc6e1ajWD
iLqhOmTQRVrght80XPYmtv2x8cdkxgECbT6T84rZtMZAdxhjdOmJ50ghPn9o/uxd
CDurhZUsu4aND6EhWw4EfdZCSt0tGQWceB9tXCKVlgc3/TXdTOB9zuyoZxkmQ6uv
rV2ffxf2VLwmR6UJSXsAz2Pd9eWJmnH+QmZPMXhOVFCMRTHTsRfAeyLW+q2xVr/r
c1nV/9PzPP29GSYVb54Fs7of2oHUuBOWp3+2oRljPeoz0SEBG/Q0TdmBqfYTol9r
GapIcROc1qg9oHV6dmQMTAkx3+Io8zlbDp3Xu2+QagtCS+94DcH9Yjh8ggM6hohX
2ofP6HQUw4TLHVTLI0iMc3MJcEZ88voQbHWKT9fYniQjKBESU21IErKT3YWP2OAo
c5RR44gCmE+r14mHCktOLLQrR6sBABEBAAGJAiUEGAECAA8FAldEmzkCGwwFCQPC
ZwAACgkQPVkZtEhFfuDc6g/+PFjc5b156juNTuSyU08/lP58vOWBeL9YxAFcRKVq
mqFQUZSs5xkEA0j0PuueHdPAmLPXO0qE3TRHHcMojI6bpnqPVR6bBHKSE+OUk2yZ
q0LRfsn/Qmn2waIDOKOxA82MAAETiG7/E+obUVGAN2E1fZ30A45eGgqcfr85QYWn
oAWhsenE4gO54ltA8YWyjYvAn+XZ7IegRQE8/Tn2sbKkg8wq/9xnX5rzwVFwanB9
Oki7djcTKeLtt9xBV6l00icB1bYAPiHGXJiBQElDXiUGqyS/yzCL0El6mbNY0NlO
kSWtfu2Rtg5pofJqs4MA8bF84//9JCHRDpQ35uBtfjhlDP0oCA1uKGM85MbBzpv/
Be12Fewqy+ofTLZZk1xPUWIUmRggw0cV2PrJpCk0Dg0E4odRI0niY4OjuA8+yiSS
AJAgYs/fSKLqbF7XMLo9yJ56Z/jrDLqO3mYUhcRAg7EiopE/VdEbFppIIu5rZ1hO
PgzFIwsuI+wrcVI1oYYbVD3gIUdJhe8QSWJ7+x1o5vQRJk0vNwh6eBJwCCeQOKn6
ikXKkkQbc3vsff7wLByyyIKs6zR8aVJk3AHs1QNBusqGZTmBRCrNHg9OJOWfrXSL
WL5zxHbfX+wspgLDLIPYFKlhSEqnfbhrK/17GAd/YF9O7TFy6FzLprmJgp9TaGao
iSI=
=i9Ui
-----END PGP PUBLIC KEY BLOCK-----
EOF >> bazel-release.pub.gpg
RUN cat bazel-release.pub.gpg | apt-key add -
#RUN curl https://bazel.build/bazel-release.pub.gpg | apt-key add -

# Install some dependencies
RUN apt-get update && apt-get install -y \
		bc \
		build-essential \
		cmake \
		curl \
		g++ \
		gfortran \
		git \
		libffi-dev \
		libfreetype6-dev \
		libhdf5-dev \
		libjpeg-dev \
		liblcms2-dev \
		libopenblas-dev \
		liblapack-dev \
		libpng12-dev \
		libssl-dev \
		libtiff5-dev \
		libwebp-dev \
		libzmq3-dev \
		nano \
		pkg-config \
		python-dev \
		software-properties-common \
		unzip \
		vim \
		wget \
		zlib1g-dev \
		qt5-default \
		libvtk6-dev \
		zlib1g-dev \
		libjpeg-dev \
		libwebp-dev \
		libpng-dev \
		libtiff5-dev \
		libjasper-dev \
		libopenexr-dev \
		libgdal-dev \
		libdc1394-22-dev \
		libavcodec-dev \
		libavformat-dev \
		libswscale-dev \
		libtheora-dev \
		libvorbis-dev \
		libxvidcore-dev \
		libx264-dev \
		yasm \
		libopencore-amrnb-dev \
		libopencore-amrwb-dev \
		libv4l-dev \
		libxine2-dev \
		libtbb-dev \
		libeigen3-dev \
		python-dev \
		python-tk \
		python-numpy \
		python3-dev \
		python3-tk \
		python3-numpy \
		ant \
		default-jdk \
		doxygen \
		bazel \
		&& \
	apt-get clean && \
	apt-get autoremove && \
	rm -rf /var/lib/apt/lists/* && \
# Link BLAS library to use OpenBLAS using the alternatives mechanism (https://www.scipy.org/scipylib/building/linux.html#debian-ubuntu)
	update-alternatives --set libblas.so.3 /usr/lib/openblas-base/libblas.so.3

# Install pip
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
	python get-pip.py && \
	rm get-pip.py

# Add SNI support to Python
RUN pip --no-cache-dir install \
		pyopenssl \
		ndg-httpsclient \
		pyasn1

# Install useful Python packages using apt-get to avoid version incompatibilities with Tensorflow binary
# especially numpy, scipy, skimage and sklearn (see https://github.com/tensorflow/tensorflow/issues/2034)
RUN apt-get update && apt-get install -y \
		python-numpy \
		python-scipy \
		python-nose \
		python-h5py \
		python-skimage \
		python-matplotlib \
		python-pandas \
		python-sklearn \
		python-sympy \
		&& \
	apt-get clean && \
	apt-get autoremove && \
	rm -rf /var/lib/apt/lists/*

# Install other useful Python packages using pip
RUN pip --no-cache-dir install --upgrade ipython && \
	pip --no-cache-dir install \
		Cython \
		ipykernel \
		jupyter \
		path.py \
		Pillow \
		pygments \
		six \
		sphinx \
		wheel \
		zmq \
		&& \
	python -m ipykernel.kernelspec

RUN git clone https://github.com/tensorflow/tensorflow
WORKDIR /tensorflow
ENV CUDNN_VERSION=6.0.21
ENV LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64
ENV PATH=/usr/local/nvidia/bin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV CUDA_PKG_VERSION=8-0=8.0.61-1
ENV CUDA_VERSION=8.0.61
RUN tensorflow/tools/ci_build/builds/configured GPU
RUN bazel build -c opt --config=cuda tensorflow/tools/pip_package:build_pip_package
RUN bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/pip
RUN pip --no-cache-dir install --upgrade /tmp/pip/tensorflow-*.whl
RUN rm -rf /tmp/pip
RUN rm -rf /root/.cahce

WORKDIR /
RUN git clone https://github.com/pytorch/pytorch
RUN git clone https://github.com/fchollet/keras

RUN pip install http://download.pytorch.org/whl/cu80/torch-0.1.12.post2-cp27-none-linux_x86_64.whl 
RUN pip install torchvision

RUN pip install -U keras theano scikit-learn scipy numpy pandas tqdm jupyter

COPY run_jupyter.sh /root/

EXPOSE 6006
EXPOSE 8888

WORKDIR /root
CMD /bin/bash
