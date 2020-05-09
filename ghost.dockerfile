FROM ubuntu:18.04

# Update package lists
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y sudo \
                        curl 

# # Install NGINX
RUN apt-get install -y nginx
# RUN ufw allow 'Nginx Full'

# Add the NodeSource APT repository for Node 12
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash

# Install Node.js, Ghost CLI
RUN apt-get install -y nodejs
RUN npm install ghost-cli@latest -g

RUN mkdir -p /var/www/ghost

# Create a new user and follow prompts
RUN useradd -ms /bin/bash lloyd
# Add user to superuser group to unlock admin privileges
RUN usermod -aG sudo lloyd

RUN chown lloyd:lloyd /var/www/ghost
RUN chmod 775 /var/www/ghost
RUN cd /var/www/ghost

USER lloyd
WORKDIR /var/www/ghost

RUN ghost install local

EXPOSE 2368
CMD ["node", "current/index.js"]












