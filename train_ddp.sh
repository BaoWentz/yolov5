TAG="20230802"
exp_name="5m_$TAG"
data_yaml_name="VOC_OCR_$TAG.yaml"
cd /home/slk/cha/yolov5/yolov5

gpu_num=3
batch_size_per_gpu=64
batch_size=$(($gpu_num*$batch_size_per_gpu))

# python train.py --data VOC_OCR.yaml --cfg yolov5m.yaml --weights '' --batch-size 128
python -m torch.distributed.launch --nproc_per_node $gpu_num train.py \
--batch-size $batch_size \
--data $data_yaml_name --cfg yolov5m.yaml \
--sync-bn --workers 8 --name ${exp_name} --epochs 150 \
# --weights '/home/bwz/project/ocr-gy/yolov5/yolov5/runs/train/5m_bg2/weights/best.pt' \
# --resume

# 导出onnx
# python export.py --weights ./runs/train/${exp_name}/weights/best.pt --include onnx

# nohup /home/bwz/project/ocr-gy/yolov5/train_dep.sh &
# nohup /home/bwz/project/ocr-gy/yolov5/train_0925.sh >nohup_0925.out 2>&1 &
# /home/bwz/project/ocr-gy/yolov5/train_dep.sh
# tensorboard --logdir /home/bwz/project/ocr-gy/yolov5/yolov5/runs/train/ocr_5m_v

# docker commit 3ea41289c602  yolov5
# sudo apt install tmux -y
# tmux new -s bwz
# tmux detach  //离开终端后台运行
# tmux ls
# tmux attach -t bwz
# tmux kill-session -t bwz  //ctrl + d
# tmux switch -t bwz
# tmux rename-session -t <old-session-name> <new-session-name>
