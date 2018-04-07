FROM ubuntu:trusty
MAINTAINER Mukesh G Chandnani <mukesh51@gmail.com>

# Prevent dpkg errors
ENV TERM=xterm-256color

# Install node.js
RUN apt-get update && \
    apt-get install curl -y && \
    curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - && \
    sudo apt-get install -y nodejs 

COPY . /app
WORKDIR /app

# Install application dependencies
RUN npm install -g mocha && \
    npm install

# Set mocha test runner as entrypoint
ENTRYPOINT ["mocha"]
