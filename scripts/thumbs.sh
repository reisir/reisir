# makes thumbnails of all .mp4 files in containing folder

for f in *.mp4; 
do 
  # Get the filename without extension
  NAME="${f%.*}";

  # Get the duration with ffprobe
  DUR=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 $NAME.mp4);

  # Calculate half of the duration
  DUR_HALF=$(echo "$DUR 2" | awk '{printf "%f", $1 / $2}' | tr ',' '.' );

  # ffmpeg the thumbnail, only print stats and errors
  ffmpeg -hide_banner -loglevel error -stats \
  -ss $DUR_HALF -i $NAME.mp4 \
  -frames:v 1 $NAME.jpg 
done
