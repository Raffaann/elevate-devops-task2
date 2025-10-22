# Use an official lightweight Python image as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
# We pin Werkzeug to a compatible version to avoid the ImportError
RUN pip install Flask==2.0.1 Werkzeug==2.2.2

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable
# Note: The syntax is now ENV NAME="World"
ENV NAME="World"

# Run app.py when the container launches
CMD ["python", "app.py"]
