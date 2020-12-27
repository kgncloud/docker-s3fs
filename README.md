# S3FS Fuse Docker image

Docker image for [s3fs fuse](https://github.com/s3fs-fuse/s3fs-fuse).

## Configuration

- `AWS_ACCESS_KEY_ID` - (required)
- `AWS_SECRET_ACCESS_KEY` - (required)
- `AWS_STORAGE_BUCKET_NAME` - (required)
- `AWS_S3_AUTHFILE` - path to s3fs auth file.
- `AWS_S3_MOUNTPOINT` - mountpoint default `/mnt`
- `AWS_S3_URL` - s3 endpoint default `https://s3.amazonaws.com`
- `S3FS_ARGS` - additional s3fs mount arguments
- `DEBUG` - enable DEBUG mode.

## Usage example

```bash
docker run -d -t -i --privileged \
  --name s3fs \
  -e AWS_ACCESS_KEY_ID=xxxxxxxxxxxxxxxxxxxx \
  -e AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx \
  -e AWS_STORAGE_BUCKET_NAME=example \
  kineviz/s3fs:1.87
```

### docker-compose 

edit copy .env.example to .env, and update the value

```bash
docker-compose up -d
```

NB, requires `privileged` mode for access to fuse device.

## Status

Stable in production.
