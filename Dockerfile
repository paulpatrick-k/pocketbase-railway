FROM alpine:latest
RUN apk add --no-cache ca-certificates

# Download the latest PocketBase Linux binary
ADD https://github.com/pocketbase/pocketbase/releases/download/v0.22.9/pocketbase_0.22.9_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /app/ && \
    chmod +x /app/pocketbase && \
    rm /tmp/pb.zip

EXPOSE 8080

# Run PocketBase. The data directory will be mounted from Cloud Storage.
CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8080", "--dir=/pb/pb_data"]