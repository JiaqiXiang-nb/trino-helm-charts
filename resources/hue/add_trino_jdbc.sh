#!/bin/bash
###
 # @Author: xiangjiaqi
 # @Date: 2024-07-22 15:31:46
 # @LastEditors: xiangjiaqi
 # @LastEditTime: 2024-07-22 17:06:11
 # @Description: patch base.py
###

PATCH_FILE="/usr/share/hue/add_trino_jdbc.patch"
TARGET_FILE="/usr/share/hue/desktop/libs/notebook/src/notebook/connectors/base.py"

# Check if the patch file exists
if [ ! -f "$PATCH_FILE" ]; then
  echo "Patch file not found!"
  exit 1
fi

# Check if the target file exists
if [ ! -f "$TARGET_FILE" ]; then
  echo "Target file not found!"
  exit 1
fi

# Apply the patch
patch -p1 "$TARGET_FILE" "$PATCH_FILE"

# Check if the patch was applied successfully
if [ $? -eq 0 ]; then
  echo "Patch applied successfully."
else
  echo "Failed to apply patch."
fi