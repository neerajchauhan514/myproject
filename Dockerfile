# Use the official Ubuntu base image
FROM ubuntu

# Add metadata to the image
LABEL creator="K21Academy"

# Update package lists
RUN apt-get update

# Install NGINX
RUN apt-get install -y nginx

# Copy application files into the container's NGINX HTML directory
COPY MiniProject1 /var/www/html/

# Expose port 80 to allow outside connections
EXPOSE 80

# Command to start NGINX server in the foreground
CMD ["nginx", "-g", "daemon off;"]