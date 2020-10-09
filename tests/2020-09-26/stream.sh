ffmpeg \
-nostdin -re -f v4l2 -s '1280x720' -framerate 24 -input_format yuyv422 -i /dev/video0 \
-f alsa -ac 2 -i hw:2 -vcodec libx264 -framerate 24 -rtbufsize 1500k -s 1280x720 \
-preset ultrafast -pix_fmt yuyv422 -crf 17 -force_key_frames 'expr:gte(t,n_forced*2)' -minrate 850k \
-maxrate 1000k -b:v 1000k -bufsize 1000k -acodec libmp3lame -rtbufsize 1500k -b 128k -ar 44100 -f flv - | ffmpeg \
-f flv -i - -c copy -f flv -drop_pkts_on_overflow 1 -attempt_recovery 1 -recovery_wait_time 1 rtmp://a.rtmp.youtube.com/live2/XXXXXXXXXXXXXXXXXXXXXXX
