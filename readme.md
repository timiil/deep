深度学习相关的docker开发环境镜像



test.py:
```
import tensorflow as tf
import numpy as np
x=np.array([[1,1,1],[1,-8,1],[1,1,1]])
w=tf.Variable(initial_value=x)
sess=tf.Session()
sess.run(tf.global_variables_initializer())
print(sess.run(w))
```

测试:
```
nvidia-docker run --rm -v /home/test.py:/test.py timiil/deep:cuda9_ubuntu16.04_cudnn7.0.5_tf1.5 python3 /test.py
```

正常应该返回:

```
2019-01-17 07:22:14.760155: I tensorflow/core/platform/cpu_feature_guard.cc:137] Your CPU supports instructions that this TensorFlow binary was not compiled to use: SSE4.1 SSE4.2
2019-01-17 07:22:15.605610: I tensorflow/stream_executor/cuda/cuda_gpu_executor.cc:895] successful NUMA node read from SysFS had negative value (-1), but there must be at least one NUMA node, so returning NUMA node zero
2019-01-17 07:22:15.606319: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1105] Found device 0 with properties: 
name: P106-100 major: 6 minor: 1 memoryClockRate(GHz): 1.7085
pciBusID: 0000:10:00.0
totalMemory: 5.94GiB freeMemory: 5.86GiB
2019-01-17 07:22:15.606348: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1195] Creating TensorFlow device (/device:GPU:0) -> (device: 0, name: P106-100, pci bus id: 0000:10:00.0, compute capability: 6.1)
[[ 1  1  1]
 [ 1 -8  1]
 [ 1  1  1]]
```
