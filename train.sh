exp_name='5l_t_bg'
cd /home/bwz/project/ocr-gy/yolov5/yolov5

# python train.py --data VOC_OCR.yaml --cfg yolov5m.yaml --weights '' --batch-size 128
python -m torch.distributed.launch --nproc_per_node 2 train.py \
--batch-size 88 --data VOC_OCR_bg.yaml --cfg yolov5l.yaml \
--weights '' \
--sync-bn --workers 8 --name ${exp_name} --epochs 300 \
# --resume

# python export.py --weights ./runs/train/${exp_name}/weights/best.pt --include onnx

# nohup /home/bwz/project/ocr-gy/yolov5/train.sh >nohup_5l_t_bg.out 2>&1 &
# tensorboard --logdir /home/bwz/project/ocr-gy/yolov5/yolov5/runs/train/exp9

# docker commit 3ea41289c602  yolov5
# sudo apt install tmux -y
# tmux new -s bwz
# tmux detach  //离开终端后台运行
# tmux ls
# tmux attach -t bwz
# tmux kill-session -t bwz  //ctrl + d
# tmux switch -t bwz
# tmux rename-session -t <old-session-name> <new-session-name>
