# Use an official Ubuntu base image
FROM ubuntu:20.04

# Set the maintainer label
LABEL maintainer="wingnut0310 <wingnut0310@gmail.com>"

# Set up environment variables
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en

# Install required dependencies for your service
RUN apt-get update && apt-get install -y \
    curl \
    bash \
    # Add any other dependencies you need, such as web server (nginx) or Wings dependencies
    && apt-get clean

# Copy any files needed for your application (replace these with your actual app files)
COPY ./app /app

# Set the working directory
WORKDIR /app

# Expose the port that your app will run on (adjust this as necessary)
EXPOSE 8080

# Default command to run the service (replace this with your specific command)
CMD ["bash"]
