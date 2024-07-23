#!/bin/bash

ARCH=$(uname -m)

if [ "$ARCH" = "x86_64" ]; then
    URL="https://files.serverless.industries/bin/busybox.amd64"
elif [ "$ARCH" = "aarch64" ]; then
    URL="https://files.serverless.industries/bin/busybox.aarch64"
else
    echo "Unsupported architecture"
    exit 1
fi

curl -o /sbin/busybox $URL
ln -s /sbin/busybox /sbin/gzip

if [ $? -eq 0 ]; then
    echo "Download successful"
else
    echo "Download failed"
fi