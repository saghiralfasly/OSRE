#!/bin/bash

python -m torch.distributed.launch --nproc_per_node 8 --master_port 9527 train.py  --workers 8 --device 0,1,2,3,4,5,6,7 --batch-size 64 --epochs 100 --data data/OSRE_dataRotation.yaml --img 640 640 --cfg cfg/training/OSRE-yolov7-IDetect.yaml --name Exp_OSRE_yolov7_Rotation_loss_0_1 --weights weights/yolov7.pt --hyp data/hyp.scratch.Rotation_loss_01.yaml

python -m torch.distributed.launch --nproc_per_node 8 --master_port 9527 train.py  --workers 8 --device 0,1,2,3,4,5,6,7 --batch-size 64 --epochs 100 --data data/OSRE_dataRotation.yaml --img 640 640 --cfg cfg/training/OSRE-yolov7-IDetect.yaml --name Exp_OSRE_yolov7_Rotation_loss_0_05 --weights weights/yolov7.pt --hyp data/hyp.scratch.Rotation_loss_005.yaml

python -m torch.distributed.launch --nproc_per_node 8 --master_port 9527 train.py  --workers 8 --device 0,1,2,3,4,5,6,7 --batch-size 64 --epochs 100 --data data/OSRE_dataRotation.yaml --img 640 640 --cfg cfg/training/OSRE-yolov7-IDetect.yaml --name Exp_OSRE_yolov7_Rotation_loss_0_02 --weights weights/yolov7.pt --hyp data/hyp.scratch.Rotation_loss_002.yaml 