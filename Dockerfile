# Dockerfile
FROM ubuntu:20.04
LABEL maintainer="wingnut0310 <wingnut0310@gmail.com>"

# Set locale environment variables
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en

# Install dependencies and Gotty
RUN apt-get update && apt-get install -y \
    curl \
    && curl -sLk https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz \
    | tar xzC /usr/local/bin \
    && apt-get clean

# Copy the gotty.sh script into the container
COPY gotty.sh /gotty.sh

# Set executable permission
RUN chmod +x /gotty.sh

# Expose the port that gotty will use
EXPOSE 9090

# Run the gotty script
CMD ["/bin/bash", "/gotty.sh"]
