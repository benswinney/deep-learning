#!/bin/bash
source /opt/DL/tensorflow/bin/tensorflow-activate
python cifar10_train.py --ps_hosts=10.0.0.4:2222 --worker_hosts=10.0.0.2:2222,10.0.0.3:2222 --job_name=worker --task_index=1


