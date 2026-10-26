FROM alpine:latest

# Install required certificates and tools
RUN apk add --no-cache ca-certificates unzip wget

# Set working directory
WORKDIR /pb

# Download and unzip PocketBase Linux version
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.22.21/pocketbase_0.22.21_linux_amd64.zip \
    && unzip pocketbase_0.22.21_linux_amd64.zip \
    && rm pocketbase_0.22.21_linux_amd64.zip

# Expose port 8080 for Render
EXPOSE 8080

# Start PocketBase server listening on all network interfaces
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080", "--dir=/pb/pb_data"]
