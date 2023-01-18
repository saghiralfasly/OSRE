#!/bin/bash

# we used yolo7 weights for all. however, it is better to tune each model with its weights

python -m torch.distributed.launch --nproc_per_node 8 --master_port 9527 train.py  --workers 8 --device 0,1,2,3,4,5,6,7 --batch-size 64 --epochs 100 --data data/OSRE_dataRotation.yaml --img 640 640 --cfg cfg/baseline/OSRE-r50-csp.yaml --name Exp_OSRE-r50-csp --weights weights/yolov7.pt --hyp data/hyp.scratch.Rotation_loss_03.yaml

python -m torch.distributed.launch --nproc_per_node 8 --master_port 9527 train.py  --workers 8 --device 0,1,2,3,4,5,6,7 --batch-size 64 --epochs 100 --data data/OSRE_dataRotation.yaml --img 640 640 --cfg cfg/baseline/OSRE-x50-csp.yaml --name Exp_OSRE-x50-csp --weights weights/yolov7.pt --hyp data/hyp.scratch.Rotation_loss_03.yaml

python -m torch.distributed.launch --nproc_per_node 8 --master_port 9527 train.py  --workers 8 --device 0,1,2,3,4,5,6,7 --batch-size 64 --epochs 100 --data data/OSRE_dataRotation.yaml --img 640 640 --cfg cfg/baseline/OSRE-yolor-csp.yaml --name Exp_OSRE-yolor-csp --weights weights/yolov7.pt --hyp data/hyp.scratch.Rotation_loss_03.yaml

python -m torch.distributed.launch --nproc_per_node 8 --master_port 9527 train.py  --workers 8 --device 0,1,2,3,4,5,6,7 --batch-size 64 --epochs 100 --data data/OSRE_dataRotation.yaml --img 640 640 --cfg cfg/baseline/OSRE-yolor-csp-x.yaml --name Exp_OSRE-yolor-csp-x --weights weights/yolov7.pt --hyp data/hyp.scratch.Rotation_loss_03.yaml

python -m torch.distributed.launch --nproc_per_node 8 --master_port 9527 train.py  --workers 8 --device 0,1,2,3,4,5,6,7 --batch-size 64 --epochs 100 --data data/OSRE_dataRotation.yaml --img 640 640 --cfg cfg/baseline/OSRE-yolor-d6.yaml --name Exp_OSRE-yolor-d6 --weights weights/yolov7.pt --hyp data/hyp.scratch.Rotation_loss_03.yaml

python -m torch.distributed.launch --nproc_per_node 8 --master_port 9527 train.py  --workers 8 --device 0,1,2,3,4,5,6,7 --batch-size 64 --epochs 100 --data data/OSRE_dataRotation.yaml --img 640 640 --cfg cfg/baseline/OSRE-yolor-e6.yaml --name Exp_OSRE-yolor-e6 --weights weights/yolov7.pt --hyp data/hyp.scratch.Rotation_loss_03.yaml

python -m torch.distributed.launch --nproc_per_node 8 --master_port 9527 train.py  --workers 8 --device 0,1,2,3,4,5,6,7 --batch-size 64 --epochs 100 --data data/OSRE_dataRotation.yaml --img 640 640 --cfg cfg/baseline/OSRE-yolor-p6.yaml --name Exp_OSRE-yolor-p6 --weights weights/yolov7.pt --hyp data/hyp.scratch.Rotation_loss_03.yaml

python -m torch.distributed.launch --nproc_per_node 8 --master_port 9527 train.py  --workers 8 --device 0,1,2,3,4,5,6,7 --batch-size 64 --epochs 100 --data data/OSRE_dataRotation.yaml --img 640 640 --cfg cfg/baseline/OSRE-yolor-w6.yaml --name Exp_OSRE-yolor-w6 --weights weights/yolov7.pt --hyp data/hyp.scratch.Rotation_loss_03.yaml

python -m torch.distributed.launch --nproc_per_node 8 --master_port 9527 train.py  --workers 8 --device 0,1,2,3,4,5,6,7 --batch-size 64 --epochs 100 --data data/OSRE_dataRotation.yaml --img 640 640 --cfg cfg/baseline/OSRE-yolov3.yaml --name Exp_OSRE-yolov3 --weights weights/yolov7.pt --hyp data/hyp.scratch.Rotation_loss_03.yaml

python -m torch.distributed.launch --nproc_per_node 8 --master_port 9527 train.py  --workers 8 --device 0,1,2,3,4,5,6,7 --batch-size 64 --epochs 100 --data data/OSRE_dataRotation.yaml --img 640 640 --cfg cfg/baseline/OSRE-yolov3-spp.yaml --name Exp_OSRE-yolov3 --weights weights/yolov7.pt --hyp data/hyp.scratch.Rotation_loss_03.yaml

python -m torch.distributed.launch --nproc_per_node 8 --master_port 9527 train.py  --workers 8 --device 0,1,2,3,4,5,6,7 --batch-size 64 --epochs 100 --data data/OSRE_dataRotation.yaml --img 640 640 --cfg cfg/baseline/OSRE-yolov4-csp.yaml --name Exp_OSRE-yolov4-csp --weights weights/yolov7.pt --hyp data/hyp.scratch.Rotation_loss_03.yaml

