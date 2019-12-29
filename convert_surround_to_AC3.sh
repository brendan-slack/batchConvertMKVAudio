#!/bin/bash
set -e # exit script of control-c is used
USAGE="Usage: convert_video.sh source_dir destination_dir"
# --- Options processing -------------------------------------------
if [ $# == 0 ] ; then
    echo $USAGE
    exit 1;
fi
# Convert relative path to absolute. Also remove trailing slash
SOURCE_DIR="$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"
SOURCE_DIR=$(dirname "$SOURCE_DIR/temp") # this fixes . and ./
DESTINATION_DIR="$(cd "$(dirname "$2")"; pwd)/$(basename "$2")"
DESTINATION_DIR=$(dirname "$DESTINATION_DIR/temp") # this fixes . and ./
find "$SOURCE_DIR" \( -iname '*.mkv' \) -type f -print | while read -r FILE
do
  ORIG_DIR=$(dirname "$FILE")
  # Get basename (filename) with extension
  BASE=$(basename "$FILE") # get filename
  NEW_DIR=${ORIG_DIR/$SOURCE_DIR/$DESTINATION_DIR}
  mkdir -p "$NEW_DIR"
  NEW_FILE="$NEW_DIR/$BASE"
  if [ ! -f "$NEW_FILE" ]; then
    echo "Converting $FILE to $NEW_FILE"
    # </dev/null added so ffmpeg doesn't read input
    ffmpeg -hide_banner -i "$FILE" -map 0:v:0 -map 0:a:0 -map 0:a:1? -map 0:s? -c:v copy -c:a:0 copy -c:a:1 ac3 -c:s copy "$NEW_FILE" </dev/null
  fi
done