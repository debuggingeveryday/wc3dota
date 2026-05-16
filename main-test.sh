#!/bin/bash

TARGET_WINDOW_NAME="Warcraft III"

# SCREEN_WIDTH=$(xdpyinfo | grep dimensions | awk '{print $2}' | sed 's/x/\ /g' | awk '{print $1}')
# SCREEN_HEIGHT=$(xdpyinfo | grep dimensions | awk '{print $2}' | sed 's/x/\ /g' | awk '{print $2}')

IS_WINDOW_ACTIVE=false

COLUMN_ONE=79.68
COLUMN_TWO=85.15
COLUMN_THREE=90.63
COLUMN_FOUR=96.32

ROW_ONE=81.94
ROW_TWO=88.88
ROW_THREE=95.83

skill_location_q() {
  local get_window_size_width=$1
  local get_window_size_height=$2

  X=$(echo "$get_window_size_width * ($COLUMN_ONE / 100)" | bc -l)
  Y=$(echo "$get_window_size_height * ($ROW_THREE / 100)" | bc -l)

  RX=$(awk "BEGIN {printf \"%.0f\", $X}")
  RY=$(awk "BEGIN {printf \"%.0f\", $Y}")

  echo "$RX, $RY"
}

mouse_window_lock() {
  if [[ "$IS_WINDOW_ACTIVE" == "true" ]]; then
    eval "$(xdotool getmouselocation --shell)"

    MOUSE_POSITION_X=$X
    MOUSE_POSITION_Y=$Y

    eval $(xdotool getwindowgeometry --shell $WINDOW_ID)

    WINDOW_POSITION_X=$X
    WINDOW_POSITION_Y=$Y

    WINDOW_SIZE_WIDTH=$WIDTH
    WINDOW_SIZE_HEIGHT=$HEIGHT

    WINDOW_MOUSE_POSITION_X=$((MOUSE_POSITION_X - WINDOW_POSITION_X))
    WINDOW_MOUSE_POSITION_Y=$((MOUSE_POSITION_Y - WINDOW_POSITION_Y))

    # if overlap left window
    if [[ $MOUSE_POSITION_X -lt $WINDOW_POSITION_X ]]; then
      xdotool mousemove $WINDOW_POSITION_X $MOUSE_POSITION_Y
    fi

    # if overlap right window
    if [[ $MOUSE_POSITION_X -gt $((WINDOW_POSITION_X + WINDOW_SIZE_WIDTH)) ]]; then
      xdotool mousemove $((WINDOW_POSITION_X + WINDOW_SIZE_WIDTH)) $MOUSE_POSITION_Y
    fi

    # if overlap right window
    if [[ $MOUSE_POSITION_X -gt $((WINDOW_POSITION_X + WINDOW_SIZE_WIDTH)) ]]; then
      xdotool mousemove $((WINDOW_POSITION_X + WINDOW_SIZE_WIDTH - 5)) $MOUSE_POSITION_Y
    fi

    # if overlap top window
    if [[ $MOUSE_POSITION_Y -lt $WINDOW_POSITION_Y ]]; then
      xdotool mousemove $MOUSE_POSITION_X $WINDOW_POSITION_Y 
    fi

    # if overlap bottom window
    if [[ $MOUSE_POSITION_Y -gt $((WINDOW_POSITION_Y + WINDOW_SIZE_HEIGHT)) ]]; then
      xdotool mousemove $MOUSE_POSITION_X $((WINDOW_POSITION_Y + WINDOW_SIZE_HEIGHT - 5)) 
    fi
  
    echo -e "
      MOUSE_POSITION_Y: $MOUSE_POSITION_Y
      MOUSE_POSITION_X: $MOUSE_POSITION_X

      WINDOW_SIZE_HEIGHT: $WINDOW_SIZE_HEIGHT
      WINDOW_SIZE_WIDTH: $WINDOW_SIZE_WIDTH
      WINDOW_POSITION_Y: $WINDOW_POSITION_Y
      WINDOW_POSITION_X: $WINDOW_POSITION_X 

      WINDOW_MOUSE_POSITION_Y: $WINDOW_MOUSE_POSITION_Y
      WINDOW_MOUSE_POSITION_X: $WINDOW_MOUSE_POSITION_X
    " 
  fi
}

while true; do
  WINDOW_ID=$(xdotool getactivewindow)
  WINDOW_NAME=$(xdotool getwindowname $WINDOW_ID)

  IS_WINDOW_ACTIVE=$([ "$TARGET_WINDOW_NAME" == "$WINDOW_NAME" ] && echo "true" || echo "false")

  mouse_window_lock
  
  if [[ "$IS_WINDOW_ACTIVE" == "true" ]]; then
    break
  fi
  
  sleep 0.01
done
