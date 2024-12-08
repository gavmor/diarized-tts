#!/bin/bash

# Usage:
# <input.txt voi.sh
#
# The input format is:
#
#     en_US:Where is my car?
#     zh_CN:我的车在哪儿？

MODEL_DIR=/media/userface/Data\ Windows/piper-voices

# Truncate file
</dev/null > output.mp3

while IFS=: read language text; do
  model_path="$(find "$MODEL_DIR" -type f -name "$language*medium*onnx" | tail -1)"
  echo $text \
  | piper --model "$model_path" --output-raw \
  | lame -r -s 22 -m m --bitwidth 16 -b 192 - \
  >> "output.mp3"
done

# Play the output file
cvlc "output.mp3"
