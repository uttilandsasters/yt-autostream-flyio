# Gunakan base image Debian
FROM debian:latest

# Install FFmpeg dan dependensi dasar
RUN apt update && \
    apt install -y ffmpeg curl && \
    apt clean

# Copy file video dan script ke container
COPY video.mp4 /app/video.mp4
COPY entrypoint.sh /app/entrypoint.sh

# Beri izin eksekusi untuk script
RUN chmod +x /app/entrypoint.sh

# Jalankan script saat container start
CMD ["/app/entrypoint.sh"]
