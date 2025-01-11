# Use the official Nginx image as the base
FROM nginx:latest

# Install OpenSSL for generating self-signed certificates
RUN apt-get update && apt-get install -y openssl && apt-get clean

# Create directory for SSL certificates
RUN mkdir -p /etc/ssl/nginx

# Generate a self-signed certificate (valid for 365 days)
RUN openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/ssl/nginx/self-signed.key \
    -out /etc/ssl/nginx/self-signed.crt \
    -subj "/C=US/ST=New Jersey/L=City/O=Organization/OU=Unit/CN=localhost"

# Copy your custom Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose HTTP and HTTPS ports
EXPOSE 80
EXPOSE 443
