# Use Ubuntu 20.04 as the base image
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install Python 2.7, development tools, and curl
RUN apt-get update && \
    apt-get install -y \
        python2.7 \
        python2-dev \
        ca-certificates \
        build-essential \
        curl

# Install pip for Python 2.7
RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py && \
    python2 get-pip.py

WORKDIR /app

COPY . .

# Install Python dependencies
RUN pip2 install -r requirements/production.txt

# Install the package defined in setup.py
RUN python2 setup.py install

# Set the entry point for your application if needed
CMD ["/usr/local/bin/blogofile"]
