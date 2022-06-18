exp_name='5m_bg2'
cd /home/bwz/project/ocr-gy/yolov5/yolov5

# python train.py --data VOC_OCR.yaml --cfg yolov5m.yaml --weights '' --batch-size 128
python -m torch.distributed.launch --nproc_per_node 2 train.py \
--batch-size 128 --data VOC_OCR_produce_bg2.yaml --cfg yolov5m.yaml \
--weights '/home/bwz/project/ocr-gy/yolov5/yolov5/runs/train/5m_bg/weights/best.pt' \
--sync-bn --workers 8 --name ${exp_name} --epochs 125 \
# --resume

python export.py --weights ./runs/train/${exp_name}/weights/best.pt --include onnx

# nohup /home/bwz/project/ocr-gy/yolov5/train_dep.sh &
# nohup /home/bwz/project/ocr-gy/yolov5/train_produce2.sh >nohup_5m_bg2.out 2>&1 &
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
