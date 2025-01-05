#!/bin/bash

SOURCE_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
DEST_DIR="./config/"

rsync -av --update --existing "$SOURCE_DIR/" "$DEST_DIR"
