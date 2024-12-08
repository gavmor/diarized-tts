#!/bin/bash

# Usage:
# <input.txt voi.sh

MODEL_PATH=/media/userface/Data\ Windows/piper-voices/zh/zh_CN/huayan/medium/zh_CN-huayan-medium.onnx

</dev/null > output.mp3

while IFS=: read language speaker text; do
  echo $text \
  | piper --model "$MODEL_PATH" --output-raw \
  | lame -r -s 22 -m m --bitwidth 16 -b 192 - \
  >> "output.mp3"
done

# Execute the commands with parameters
# echo "$TEXT" \
#  | piper --model "$MODEL_PATH" --output-raw \
#  | lame -r -s 22 -m m --bitwidth 16 -b 192 - \
#  >> "$OUTPUT_FILE"

# Play the output file
cvlc "output.mp3"
