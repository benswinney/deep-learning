# powerai_recipe
##Introduction
Front end to deploy any of the IBM PowerAI supported Deep Learning Frameworks across multiple target machines.

IBM's PowerAI documentation can be found at [ibm.biz/powerai](http://ibm.biz/powerai)

##Supported Frameworks
[caffe-bvlc](https://github.com/BVLC/caffe) Berkeley Vision and Learning Center caffe Framework <br>
[caffe-nv](https://github.com/NVIDIA/caffe) Nvidia Fork of the BVLC version of caffe <br>
[caffe-ibm]() IBM Version of the caffe framework. <br>
[digits](https://github.com/NVIDIA/DIGITS) DIGITS (the Deep Learning GPU Training System) is a webapp for training deep learning models.<br>
[tensorflow](https://www.tensorflow.org/) TensorFlow™ is an open source software library for numerical computation using data flow graphs.  Provided by Google<br>
[torch](https://github.com/torch/torch7) orch is the main package in Torch7 where data structures for multi-dimensional tensors and mathematical operations over these are defined.<br>
[theano](http://deeplearning.net/software/theano/) Theano is a Python library that allows you to define, optimize, and evaluate mathematical expressions involving multi-dimensional arrays efficiently. Theano features:
<br>

## Prerequisites
Before proceeding to the installation steps, a few tasks need to be completed before hand.

### Create Network Bridge
Create a network bridge named "br0" with port connected to management network (192.168.3.0/24).

Below is an example interface defined in the local "/etc/network/interfaces" file. Note that "enP1p3s0f0" is the name of the interface connected to the management network.

- auto br0
- iface br0 inet static
     - address 192.168.3.3
     - netmask 255.255.255.0
     - bridge_ports enP1p3s0f0

### Download NVIDIA CuDNN
PowerAI requires NVIDIA's CuDNN library. Visit [https://developer.nvidia.com/cudnn]([https://developer.nvidia.com/cudnn).
- Login or register for NVIDIA's Accelerated Computing Developer Program.
- Download the following .deb files
  - cuDNN v5.1 Runtime Library for Ubuntu 16.04 Power8 (Deb)
  - cuDNN v5.1 Developer Library for Ubuntu 16.04 Power8 (Deb)
- Copy the .deb files to the management server and export the CUDNN5 and CUDNN environment variable pointing to the location of the .deb files.

### Download Mellanox OFED
This solution has an option to use an available InfiniBand network. In order to automate the network configuration, the Mellanox OFED package is required. Visit [the Mellanox download site](http://www.mellanox.com/page/products_dyn?product_family=26&mtag=linux_sw_drivers)
- Download the latest .tgz file for Ubuntu 16.04 ppc64le 
- Copy the .tgz file to the management server and export the MLX_OFED environment variable pointing to the location of the .tgz file.
 
## Basic Installation Instructions
1. git clone https://github.ibm.com/dlehr/powerai_recipe
2. Run `install.sh`
3. Build/edit the config.yml file using one of the templates provided.
4. Run `deploy.sh <desired config file>` to initiate deployment.

## Distributed Tensorflow
The first of many rack solutions designed to allow for ease of deploying a distributed workload across many heteregenous nodes in a cluster.

###Configuration
The PowerAI recipe can deploy distributed tensorflow across any possible combination of machines.  For sample purposes, we have provided a configuration with 3 nodes(1 Parameter Server, and 2 Workers) 
`config.yml.tfdist.3min`. More information in the recipe document in the /documents folder.

In every configuration, there are Parameter, and Worker nodes.  In here you can specify which machines are designated to which server type.  

###Installation
The configuration sample above will ensure tensorflow, cuda, and cudnn are installed on each machine in the cluster.

###Samples
The Distributed Tensorflow config for the PowerAI recipe currently includes two sample training sets.  Cifar10, and mnist.
All samples can be found in `/opt/DL/tensorflow/samples`

`/opt/DL/tensorflow/samples/dist_deb.sh` is custom created to reflect the racksetup on every machine.  To try out a specific sample execute `dist_deb.sh` with the desired model
i.e. `dist_deb.sh mnist/mnist_train.py` or `dist_deb.sh cifar10/cifar10_train.py`


