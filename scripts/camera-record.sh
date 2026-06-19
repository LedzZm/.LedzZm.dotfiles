#!/usr/bin/env bash
set -euo pipefail

VIDEO_DEV="/dev/video0"
# AUDIO_DEV="default"

OUTPUT="recording-$(date +%Y%m%d-%H%M%S).mkv"


# TODO: Fix delay before live previe
# TODO: Should probably start the preview first then the recording
# TODO: Check If I can use that in any other way to include interactive elements like start stop pause etc... or display elapsed time etc etc...

# TODO: Fix AUDIO TAHT SUCKS
# MAKE AUDIO OPTIONAL



ffmpeg \
  -f v4l2 -thread_queue_size 512 -i "$VIDEO_DEV" \
  -filter_complex "[0:v]split=2[rec][prev]" \
  \
  -map "[rec]" \
  -c:v libx264 -preset slow -crf 18 \
  "$OUTPUT" \
  \
  -map "[prev]" \
  -c:v libx264 -preset ultrafast -tune zerolatency \
  -f mpegts - \
| ffplay \
    -fflags nobuffer \
    -flags low_delay \
    -framedrop \
    -

echo "Saved: $OUTPUT"

