#!/bin/bash

rm -f output/*

# Mode (easy, normal, hard, super_hard, ultra_hard, custom)
MODE="normal"

# Flip
# Horizontal flip: FLIP="-vf hflip"
# Vertical flip: FLIP="-vf vflip"
# No flip: FLIP=""
FLIP=""

# Clear metadata
# To clear: CLEAR_METADATA="-map_metadata -1"
# Not clear: CLEAR_METADATA=""
CLEAR_METADATA="-map_metadata -1"

# Trim start (seconds). The value must be an int in the range 0 to 59
TRIM_START="0"

# Random filename
# Enable random filename: RAND_FILENAME=1
# Disable random filename: RAND_FILENAME=0
RAND_FILENAME=0

# Random resolution
if [ "$MODE" == "easy" ]; then
    RAND_RESOLUTION=$(awk -v min=1.00 -v max=1.05 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "normal" ]; then
    RAND_RESOLUTION=$(awk -v min=1.05 -v max=1.10 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "hard" ]; then
    RAND_RESOLUTION=$(awk -v min=1.10 -v max=1.20 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "super_hard" ]; then
    RAND_RESOLUTION=$(awk -v min=1.20 -v max=1.30 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "ultra_hard" ]; then
    RAND_RESOLUTION=$(awk -v min=1.30 -v max=1.40 'BEGIN{srand(); print min+rand()*(max-min)}')
fi

# Random volume
if [ "$MODE" == "easy" ]; then
    RAND_VOLUME=$(awk -v min=1.00 -v max=1.05 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "normal" ]; then
    RAND_VOLUME=$(awk -v min=1.05 -v max=1.10 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "hard" ]; then
    RAND_VOLUME=$(awk -v min=1.10 -v max=1.20 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "super_hard" ]; then
    RAND_VOLUME=$(awk -v min=1.20 -v max=1.30 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "ultra_hard" ]; then
    RAND_VOLUME=$(awk -v min=1.30 -v max=1.40 'BEGIN{srand(); print min+rand()*(max-min)}')
fi

# Random gamma
# The value must be a float in the range 0.1 to 10.0.
# The default value is "1".
if [ "$MODE" == "easy" ]; then
    RAND_GAMMA=$(awk -v min=1.00 -v max=1.05 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "normal" ]; then
    RAND_GAMMA=$(awk -v min=1.05 -v max=1.10 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "hard" ]; then
    RAND_GAMMA=$(awk -v min=1.10 -v max=1.20 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "super_hard" ]; then
    RAND_GAMMA=$(awk -v min=1.20 -v max=1.30 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "ultra_hard" ]; then
    RAND_GAMMA=$(awk -v min=1.30 -v max=1.40 'BEGIN{srand(); print min+rand()*(max-min)}')
fi

# Random saturation
# The value must be a float in the range 0.0 to 3.0.
# The default value is "1".
if [ "$MODE" == "easy" ]; then
    RAND_SATURATION=$(awk -v min=1.00 -v max=1.05 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "normal" ]; then
    RAND_SATURATION=$(awk -v min=1.05 -v max=1.10 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "hard" ]; then
    RAND_SATURATION=$(awk -v min=1.10 -v max=1.20 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "super_hard" ]; then
    RAND_SATURATION=$(awk -v min=1.20 -v max=1.30 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "ultra_hard" ]; then
    RAND_SATURATION=$(awk -v min=1.30 -v max=1.40 'BEGIN{srand(); print min+rand()*(max-min)}')
fi

# Random brightness
# The value must be a float value in the range -1.0 to 1.0.
# The default value is "0".
if [ "$MODE" == "easy" ]; then
    RAND_BRIGHTNESS=$(awk -v min=0.00 -v max=0.05 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "normal" ]; then
    RAND_BRIGHTNESS=$(awk -v min=0.05 -v max=0.10 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "hard" ]; then
    RAND_BRIGHTNESS=$(awk -v min=0.10 -v max=0.20 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "super_hard" ]; then
    RAND_BRIGHTNESS=$(awk -v min=0.20 -v max=0.30 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "ultra_hard" ]; then
    RAND_BRIGHTNESS=$(awk -v min=0.30 -v max=0.40 'BEGIN{srand(); print min+rand()*(max-min)}')
fi

# Random speed
if [ "$MODE" == "easy" ]; then
    RAND_SPEED=$(awk -v min=1.00 -v max=1.02 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "normal" ]; then
    RAND_SPEED=$(awk -v min=1.02 -v max=1.04 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "hard" ]; then
    RAND_SPEED=$(awk -v min=1.04 -v max=1.06 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "super_hard" ]; then
    RAND_SPEED=$(awk -v min=1.06 -v max=1.08 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "ultra_hard" ]; then
    RAND_SPEED=$(awk -v min=1.08 -v max=1.10 'BEGIN{srand(); print min+rand()*(max-min)}')
fi

# Random crop
# The value must be a float in the range 0.0 to 1.0.
# The default value is "1".
if [ "$MODE" == "easy" ]; then
    RAND_CROP=$(awk -v min=0.98 -v max=1.00 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "normal" ]; then
    RAND_CROP=$(awk -v min=0.96 -v max=0.98 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "hard" ]; then
    RAND_CROP=$(awk -v min=0.94 -v max=0.96 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "super_hard" ]; then
    RAND_CROP=$(awk -v min=0.92 -v max=0.94 'BEGIN{srand(); print min+rand()*(max-min)}')
elif [ "$MODE" == "ultra_hard" ]; then
    RAND_CROP=$(awk -v min=0.90 -v max=0.92 'BEGIN{srand(); print min+rand()*(max-min)}')
fi

# Custom mode params
if [ "$MODE" == "custom" ]; then
    RAND_FILENAME=0
    FLIP=""
    CLEAR_METADATA="-map_metadata -1"
    TRIM_START="1"
    RAND_RESOLUTION="1.10"
    RAND_VOLUME="1.20"
    RAND_GAMMA="1.20"
    RAND_SATURATION="1.20"
    RAND_BRIGHTNESS="0.20"
    RAND_SPEED="1.08"
    RAND_CROP="0.90"
fi

echo "MODE: $MODE RAND_FILENAME: $RAND_FILENAME, FLIP: $FLIP, CLEAR_METADATA: $CLEAR_METADATA, TRIM_START: $TRIM_START, RAND_RESOLUTION: $RAND_RESOLUTION, RAND_VOLUME: $RAND_VOLUME, RAND_GAMMA: $RAND_GAMMA, RAND_SATURATION: $RAND_SATURATION, RAND_BRIGHTNESS: $RAND_BRIGHTNESS, RAND_SPEED: $RAND_SPEED, RAND_CROP: $RAND_CROP"

for f in input/*; do
    INPUT_FILENAME="$f"
    if [ "$RAND_FILENAME" == "1" ]; then
        OUTPUT_FILENAME="$(openssl rand -hex 16).mp4"
    else
        OUTPUT_FILENAME=$(basename "$f" .mp4)_output.mp4
    fi
    ffmpeg -i "$INPUT_FILENAME" -ss "00:00:$TRIM_START" -vf "scale=ceil(iw*$RAND_RESOLUTION/2)*2:ceil(ih*$RAND_RESOLUTION/2)*2,eq=gamma=$RAND_GAMMA:saturation=$RAND_SATURATION:brightness=$RAND_BRIGHTNESS,setpts=PTS/$RAND_SPEED,crop=in_w*$RAND_CROP:in_h*$RAND_CROP" -af "volume=$RAND_VOLUME,atempo=$RAND_SPEED" $FLIP $CLEAR_METADATA "output/$OUTPUT_FILENAME"
done

exit 0
