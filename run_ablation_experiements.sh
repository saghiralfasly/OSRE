#!/bin/bash


python -m torch.distributed.launch --nproc_per_node 8 --master_port 9527 train.py  --workers 8 --device 0,1,2,3,4,5,6,7 --batch-size 64 --epochs 100 --data data/custom_dataRotationChallenging123.yaml --img 640 640 --cfg cfg/training/yolov7-custom-IDetect.yaml --name Exp_RotationChallenging123_IDetect --weights weights/yolov7.pt --hyp data/hyp.scratch.customRotation.yaml

python -m torch.distributed.launch --nproc_per_node 8 --master_port 9527 train.py  --workers 8 --device 0,1,2,3,4,5,6,7 --batch-size 64 --epochs 100 --data data/custom_dataRotation.yaml --img 640 640 --cfg cfg/training/yolov7-custom-IDetect.yaml --name Exp_RotationRegular4_IDetect --weights weights/yolov7.pt --hyp data/hyp.scratch.customRotation.yaml

python -m torch.distributed.launch --nproc_per_node 8 --master_port 9527 train.py  --workers 8 --device 0,1,2,3,4,5,6,7 --batch-size 64 --epochs 100 --data data/custom_dataRotationFixedCamera5.yaml --img 640 640 --cfg cfg/training/yolov7-custom-IDetect.yaml --name Exp_RotationRegularFixedCamera5_IDetect --weights weights/yolov7.pt --hyp data/hyp.scratch.customRotation.yaml

python -m torch.distributed.launch --nproc_per_node 8 --master_port 9527 train.py  --workers 8 --device 0,1,2,3,4,5,6,7 --batch-size 64 --epochs 100 --data data/custom_dataRotationFixedCameraHorizontallyOnly6.yaml --img 640 640 --cfg cfg/training/yolov7-custom-IDetect.yaml --name Exp_RotationRegularFixedCameraHorizontallyOnly6_IDetect --weights weights/yolov7.pt --hyp data/hyp.scratch.customRotation.yaml

python -m torch.distributed.launch --nproc_per_node 8 --master_port 9527 train.py  --workers 8 --device 0,1,2,3,4,5,6,7 --batch-size 64 --epochs 100 --data data/custom_dataRotation456.yaml --img 640 640 --cfg cfg/training/yolov7-custom-IDetect.yaml --name Exp_RotationRegularCustom_dataRotation456_IDetect --weights weights/yolov7.pt --hyp data/hyp.scratch.customRotation.yaml


python -m torch.distributed.launch --nproc_per_node 8 --master_port 9527 train.py  --workers 8 --device 0,1,2,3,4,5,6,7 --batch-size 64 --epochs 100 --data data/custom_dataRotation123456.yaml --img 640 640 --cfg cfg/training/yolov7-custom-IDetect.yaml --name Exp_RotationAll123456_IDetect --weights weights/yolov7.pt --hyp data/hyp.scratch.customRotation.yaml




# python test.py --data data/custom_dataRotationChallenging123.yaml --cfg cfg/training/yolov7-custom-IDetect.yaml --img 640 --batch 16 --conf 0.001 --iou 0.65 --device 0 --weights best.pt --name default_yolov7_640_val


# python test.py --data data/custom_dataRotation456.yaml --cfg cfg/training/yolov7-custom-IDetect.yaml --img 640 --batch 16 --conf 0.001 --iou 0.65 --device 0 --weights best.pt --name default_yolov7_640_val

python -m torch.distributed.launch --nproc_per_node 8 --master_port 9527 train.py  --workers 8 --device 0,1,2,3,4,5,6,7 --batch-size 64 --epochs 100 --data data/custom_dataRotation12345678910.yaml --img 640 640 --cfg cfg/training/yolov7-custom-IDetect.yaml --name Exp_RotationAll12345678910_IDetect --weights weights/yolov7.pt --hyp data/hyp.scratch.customRotation.yaml
