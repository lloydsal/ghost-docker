FROM ghost:latest

RUN npm install ghost-s3-compat
RUN mkdir content/storage
RUN cp -r node_modules/ghost-s3-compat content/storage/ghost-s3-compat

