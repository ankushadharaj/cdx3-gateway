# Use the official Nginx image
FROM nginx:latest

# Copy custom Nginx configuration to the container
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80
