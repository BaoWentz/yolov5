cd /home/bwz/project/ocr-gy/yolov5

xhost +local:${USER}
WORK_DIR=${PWD}
docker run --gpus all -itd \
--rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
-u $(id -u) \
-v ${PWD}:${WORK_DIR} \
-v /home/bwz/project/ocr-gy:/home/bwz/project/ocr-gy \
-w ${WORK_DIR} \
--name yolov5 \
--ipc=host \
-e QT_X11_NO_MITSHM=1 \
-e PYTHONPATH=${WORK_DIR} \
--user root \
ultralytics/yolov5

# /home/bwz/project/ocr-gy/yolov5/run-docker.sh
