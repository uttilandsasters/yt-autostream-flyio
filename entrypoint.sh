#!/bin/bash

# Jalankan FFmpeg loop video ke YouTube Live
ffmpeg -re -stream_loop -1 -i /app/video.mp4 \
  -c:v libx264 -preset veryfast -maxrate 3000k -bufsize 6000k \
  -pix_fmt yuv420p -g 50 -c:a aac -b:a 160k \
  -f flv "rtmp://a.rtmp.youtube.com/live2/${YOUTUBE_STREAM_KEY}"
