FROM debian:buster

ENV S3FS_VERSION=1.87 S3FS_SHA256=c5e064efb8fb5134a463731a7cf8d7174c93a296957145200347d2f4d9d11985
ENV NODE_VERSION 12.20.0

ADD entry.sh /

#RUN /build-s3fs.sh

# install s3fs
RUN apt-get update
RUN apt-get -y install curl s3fs fuse libfuse2 software-properties-common \
    && s3fs --version

## allow access to volume by different user to enable UIDs other than root when using volumes
RUN echo user_allow_other >> /etc/fuse.conf

# install nodejs
RUN apt-get -y install nodejs gnupg  \
  && node --version 

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg |  apt-key add - 
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update &&  apt-get install yarn

# Install  files-upload-server
RUN yarn global add files-upload-server  \
    && files-upload-server --version

EXPOSE 8008
#For Release 
ENV NODE_ENV=production


RUN mkdir -p /data
VOLUME /data

ENTRYPOINT ["/entry.sh"]
CMD ["sh","-c","cd /data && files-upload-server -s"]
