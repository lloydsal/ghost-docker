FROM ubuntu:18.04

# Setup Variables
ENV DOCKER_WORKING_DIR /var/www/ghost

# Update package lists
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y sudo curl 

# install Node.js, Ghost CLI
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash
RUN apt-get install -y nodejs
RUN npm install ghost-cli@latest -g

RUN mkdir -p $DOCKER_WORKING_DIR

# Create a new user and assign appropriate permissions
RUN useradd -ms /bin/bash ghostUser
RUN usermod -aG sudo ghostUser
RUN chown ghostUser:ghostUser $DOCKER_WORKING_DIR
RUN chmod 775 $DOCKER_WORKING_DIR
RUN cd $DOCKER_WORKING_DIR

USER ghostUser
WORKDIR $DOCKER_WORKING_DIR

RUN ghost install local

# Install s3 Adapter to push uploaded assets to AWS S3, CDN
RUN npm install ghost-storage-adapter-s3
RUN mkdir -p ./content/adapters/storage
RUN cp -r ./node_modules/ghost-storage-adapter-s3 ./content/adapters/storage/s3

EXPOSE 2368
CMD ["node", "current/index.js"]