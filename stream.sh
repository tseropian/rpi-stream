ffmpeg \
-f alsa -thread_queue_size 2048 -ac 2 -i hw:2,0 \
-f v4l2 -thread_queue_size 2048 -input_format yuyv422 -video_size 1280x720 -i /dev/video0 \
-pix_fmt yuyv422 \
-vcodec h264_omx  -r 25 -qmin 2 -qmax 51 -b:v 2M  -minrate 850k -maxrate 1000k 
-b:v 1000k -bufsize 1000k -bufsize 10M -g 50 -crf 18  \
-acodec aac -b:a 128k -ar 44100 \
-drop_pkts_on_overflow 1 -attempt_recovery 1 -recovery_wait_time 1 \
-preset ultrafast -f flv rtmp://a.rtmp.youtube.com/live2/YOUTUBE_KEY

