exp_name='ocr_5m_v'
cd /home/bwz/project/ocr-gy/yolov5/yolov5

python export.py --weights ./runs/train/${exp_name}/weights/best.pt --include onnx

# /home/bwz/project/ocr-gy/yolov5/export.sh
