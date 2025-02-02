FROM ubuntu:20.04
LABEL maintainer="wingnut0310 <wingnut0310@gmail.com>"

# Set locale environment variables
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en

# Install dependencies (curl) and gotty
RUN apt-get update && apt-get install -y \
    curl \
    && curl -sLk https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz \
    | tar xzC /usr/local/bin \
    && apt-get clean

# Copy the run_gotty.sh script into the container
COPY run_gotty.sh /run_gotty.sh

# Set proper permissions for the script
RUN chmod +x /run_gotty.sh

# Expose the port that gotty will use (9090)
EXPOSE 9090

# Start the gotty server with the bash shell
CMD ["/bin/bash", "/run_gotty.sh"]
