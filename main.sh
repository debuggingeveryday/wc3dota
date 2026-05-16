#!/bin/bash

TARGET_WINDOW_NAME="Warcraft III"

while true; do
  WINDOW_ID=$(xdotool getactivewindow)
  WINDOW_NAME=$(xdotool getwindowname $WINDOW_ID)

  if [[ "$TARGET_WINDOW_NAME" == "$WINDOW_NAME" ]]; then
    eval "$(xdotool getmouselocation --shell)"

    MOUSE_POSITION_X=$X
    MOUSE_POSITION_Y=$Y

    eval $(xdotool getwindowgeometry --shell $WINDOW_ID)

    WINDOW_POSITION_X=$X
    WINDOW_POSITION_Y=$Y

    WINDOW_SIZE_WIDTH=$WIDTH
    WINDOW_SIZE_HEIGHT=$HEIGHT
  
    echo -e "
      MOUSE_POSITION_Y: $MOUSE_POSITION_Y
      MOUSE_POSITION_X: $MOUSE_POSITION_X

      WINDOW_SIZE_HEIGHT: $WINDOW_SIZE_HEIGHT
      WINDOW_SIZE_WIDTH: $WINDOW_SIZE_WIDTH
      WINDOW_POSITION_Y: $WINDOW_POSITION_Y
      WINDOW_POSITION_X: $WINDOW_POSITION_X
    "

  else
    echo "False"
  fi
  sleep 0.01
done
