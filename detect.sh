exp_name='exp9'
cd /home/bwz/project/ocr-gy/yolov5/yolov5

python detect.py --weights ./runs/train/${exp_name}/weights/best.onnx \
--data VOC_OCR.yaml --batch-size 16 --name ${exp_name}_onnx --view-img

# /home/bwz/project/ocr-gy/yolov5/val-onnx.sh
# tensorboard --logdir /home/ecnu-lzw/bwz/ocr-gy/yolov5/yolov5/runs/train/exp4
