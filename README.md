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

## Basic Installation Instructions
1. git clone https://github.ibm.com/dlehr/powerai_recipe
2. Run `install.sh`
3. Build/edit the config.yml file using one of the templates provided.
4. Run `deploy.sh <desired config file>` to initiate deployment.

## Distributed Tensorflow
The first of many rack solutions designed to allow for ease of deploying a distributed workload across many heteregenous nodes in a cluster.

###Configuration
The PowerAI recipe can deploy distributed tensorflow across any possible combination of machines.  For sample purposes, we have provided a configuration with 3 nodes(1 Parameter Server, and 2 Workers) 
`config.yml.tfdist.3min`

In every configuration, there are Parameter, and Worker nodes.  In here you can specify which machines are designated to which server type.  

###Installation
The configuration sample above will ensure tensorflow, cuda, and cudnn are installed on each machine in the cluster.

###Samples
The Distributed Tensorflow config for the PowerAI recipe currently includes two sample training sets.  Cifar10, and mnist.
All samples can be found in `/opt/DL/tensorflow/samples`

`/opt/DL/tensorflow/samples/dist_deb.sh` is custom created to reflect the racksetup on every machine.  To try out a specific sample execute `dist_deb.sh` with the desired model
i.e. `dist_deb.sh mnist/mnist_train.py` or `dist_deb.sh cifar10/cifar10_train.py`


