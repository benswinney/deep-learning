# powerai_recipe
##Introduction
Front end to deploy any of the IBM POWER supported Deep Learning Frameworks across multiple target machines.

##Supported Frameworks
[caffe-bvlc](https://github.com/BVLC/caffe) Berkeley Vision and Learning Center caffe Framework <br>
[caffe-nv](https://github.com/NVIDIA/caffe) Nvidia Fork of the BVLC version of caffe <br>
[caffe-ibm]() IBM Version of the caffe framework. <br>
[digits](https://github.com/NVIDIA/DIGITS) DIGITS (the Deep Learning GPU Training System) is a webapp for training deep learning models.<br>
[tensorflow](https://www.tensorflow.org/) TensorFlow™ is an open source software library for numerical computation using data flow graphs.  Provided by Google<br>
[torch](https://github.com/torch/torch7) orch is the main package in Torch7 where data structures for multi-dimensional tensors and mathematical operations over these are defined.<br>
[theano](http://deeplearning.net/software/theano/) Theano is a Python library that allows you to define, optimize, and evaluate mathematical expressions involving multi-dimensional arrays efficiently. Theano features:
<br>

## Installation Instructions
1. git clone https://github.ibm.com/dlehr/powerai_recipe
2. Run `install.sh`
3. Build/edit the config.yml file using one of the templates provided.
4. Run `deploy.sh <desired config file>` to initiate deployment.
