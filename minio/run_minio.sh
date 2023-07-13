docker run -p 9000:9000 -p 9001:9001 --name minio-server \
-d --restart=always \
-e "MINIO_ACCESS_KEY=admin" \
-e "MINIO_SECRET_KEY=admin123456" \
-v /Users/samzonglu/deploy/minio/data:/data \
-v //Users/samzonglu/deploy/minio/config:/root/.minio \
minio/minio server --console-address :9001 /data
