#!/usr/bin/env bash
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
IMG_DIR=/opt/xscreensaver/img/
echo "Need root to create $IMG_DIR"
sudo mkdir -p $IMG_DIR
sudo chown $USER:$USER $IMG_DIR
cat $SCRIPT_DIR/urls.txt | xargs wget -P $IMG_DIR
