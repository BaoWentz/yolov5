TAG="20230802"
exp_name="5m_${TAG}7"
data_yaml_name="VOC_OCR_$TAG.yaml"
cd /home/slk/cha/yolov5/yolov5

python val.py --weights ./runs/train/${exp_name}/weights/best.pt \
--data $data_yaml_name --batch-size 64 --name ${exp_name} --conf-thres 0.1

# /home/bwz/project/ocr-gy/yolov5/val.sh
