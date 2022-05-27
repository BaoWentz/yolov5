exp_name='ocr_5m_v'
cd /home/bwz/project/ocr-gy/yolov5/yolov5

python val.py --weights ./runs/train/${exp_name}/weights/best.pt \
--data VOC_OCR.yaml --batch-size 64 --name ${exp_name} --conf-thres 0.1

# /home/bwz/project/ocr-gy/yolov5/val.sh
