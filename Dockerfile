# Use an official Nginx image as the base
FROM nginx:alpine

# Copy our simple html file into the Nginx web server directory
COPY index.html /usr/share/nginx/html
