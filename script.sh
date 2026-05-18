#!/bin/bash

TARGET_WINDOW_NAME="Warcraft III"

# SCREEN_WIDTH=$(xdpyinfo | grep dimensions | awk '{print $2}' | sed 's/x/\ /g' | awk '{print $1}')
# SCREEN_HEIGHT=$(xdpyinfo | grep dimensions | awk '{print $2}' | sed 's/x/\ /g' | awk '{print $2}')

IS_WINDOW_ACTIVE=false

MOUSE_POSITION_X=
MOUSE_POSITION_Y=

WINDOW_POSITION_X=
WINDOW_POSITION_Y=

WINDOW_SIZE_WIDTH=
WINDOW_SIZE_HEIGHT=

WINDOW_MOUSE_POSITION_X=
WINDOW_MOUSE_POSITION_Y=


COLUMN_ONE=79.68
COLUMN_TWO=85.15
COLUMN_THREE=90.63
COLUMN_FOUR=96.32

ROW_ONE=81.94
ROW_TWO=88.88
ROW_THREE=95.83


skill_location_q() {
  X=$(echo "$WINDOW_SIZE_WIDTH * ($COLUMN_ONE / 100)" | bc -l)
  Y=$(echo "$WINDOW_SIZE_HEIGHT * ($ROW_THREE / 100)" | bc -l)

  X=$(awk "BEGIN {printf \"%.0f\", $X}")
  Y=$(awk "BEGIN {printf \"%.0f\", $Y}")

  X=$((X + WINDOW_POSITION_X))
  Y=$((Y + WINDOW_POSITION_Y))
  
  mouse_last_position_x=$MOUSE_POSITION_X
  mouse_last_position_y=$MOUSE_POSITION_Y

  if [[ "$IS_WINDOW_ACTIVE" == "true" ]]; then
    xdotool mousemove $X $Y click 1
    xdotool mousemove $mouse_last_position_x $mouse_last_position_y
  fi
}

skill_location_w() {
  X=$(echo "$WINDOW_SIZE_WIDTH * ($COLUMN_TWO / 100)" | bc -l)
  Y=$(echo "$WINDOW_SIZE_HEIGHT * ($ROW_THREE / 100)" | bc -l)

  X=$(awk "BEGIN {printf \"%.0f\", $X}")
  Y=$(awk "BEGIN {printf \"%.0f\", $Y}")

  X=$((X + WINDOW_POSITION_X))
  Y=$((Y + WINDOW_POSITION_Y))
  
  mouse_last_position_x=$MOUSE_POSITION_X
  mouse_last_position_y=$MOUSE_POSITION_Y

  if [[ "$IS_WINDOW_ACTIVE" == "true" ]]; then
    xdotool mousemove $X $Y click 1
    xdotool mousemove $mouse_last_position_x $mouse_last_position_y
  fi
}

skill_location_e() {
  X=$(echo "$WINDOW_SIZE_WIDTH * ($COLUMN_THREE / 100)" | bc -l)
  Y=$(echo "$WINDOW_SIZE_HEIGHT * ($ROW_THREE / 100)" | bc -l)

  X=$(awk "BEGIN {printf \"%.0f\", $X}")
  Y=$(awk "BEGIN {printf \"%.0f\", $Y}")

  X=$((X + WINDOW_POSITION_X))
  Y=$((Y + WINDOW_POSITION_Y))
  
  mouse_last_position_x=$MOUSE_POSITION_X
  mouse_last_position_y=$MOUSE_POSITION_Y

  if [[ "$IS_WINDOW_ACTIVE" == "true" ]]; then
    xdotool mousemove $X $Y click 1
    xdotool mousemove $mouse_last_position_x $mouse_last_position_y
  fi
}

skill_location_r() {
  X=$(echo "$WINDOW_SIZE_WIDTH * ($COLUMN_FOUR / 100)" | bc -l)
  Y=$(echo "$WINDOW_SIZE_HEIGHT * ($ROW_THREE / 100)" | bc -l)

  X=$(awk "BEGIN {printf \"%.0f\", $X}")
  Y=$(awk "BEGIN {printf \"%.0f\", $Y}")

  X=$((X + WINDOW_POSITION_X))
  Y=$((Y + WINDOW_POSITION_Y))
  
  mouse_last_position_x=$MOUSE_POSITION_X
  mouse_last_position_y=$MOUSE_POSITION_Y

  if [[ "$IS_WINDOW_ACTIVE" == "true" ]]; then
    xdotool mousemove $X $Y click 1
    xdotool mousemove $mouse_last_position_x $mouse_last_position_y
  fi
}

skill_location_d() {
  X=$(echo "$WINDOW_SIZE_WIDTH * ($COLUMN_TWO / 100)" | bc -l)
  Y=$(echo "$WINDOW_SIZE_HEIGHT * ($ROW_TWO / 100)" | bc -l)

  X=$(awk "BEGIN {printf \"%.0f\", $X}")
  Y=$(awk "BEGIN {printf \"%.0f\", $Y}")

  X=$((X + WINDOW_POSITION_X))
  Y=$((Y + WINDOW_POSITION_Y))
  
  mouse_last_position_x=$MOUSE_POSITION_X
  mouse_last_position_y=$MOUSE_POSITION_Y
  
  if [[ "$IS_WINDOW_ACTIVE" == "true" ]]; then
    xdotool mousemove $X $Y click 1
    xdotool mousemove $mouse_last_position_x $mouse_last_position_y
  fi
}

skill_location_f() {
  X=$(echo "$WINDOW_SIZE_WIDTH * ($COLUMN_THREE / 100)" | bc -l)
  Y=$(echo "$WINDOW_SIZE_HEIGHT * ($ROW_TWO / 100)" | bc -l)

  X=$(awk "BEGIN {printf \"%.0f\", $X}")
  Y=$(awk "BEGIN {printf \"%.0f\", $Y}")

  X=$((X + WINDOW_POSITION_X))
  Y=$((Y + WINDOW_POSITION_Y))
  
  mouse_last_position_x=$MOUSE_POSITION_X
  mouse_last_position_y=$MOUSE_POSITION_Y
  
  if [[ "$IS_WINDOW_ACTIVE" == "true" ]]; then
    xdotool mousemove $X $Y click 1
    xdotool mousemove $mouse_last_position_x $mouse_last_position_y
  fi
}

skill_location_g() {
  X=$(echo "$WINDOW_SIZE_WIDTH * ($COLUMN_FOUR / 100)" | bc -l)
  Y=$(echo "$WINDOW_SIZE_HEIGHT * ($ROW_TWO / 100)" | bc -l)

  X=$(awk "BEGIN {printf \"%.0f\", $X}")
  Y=$(awk "BEGIN {printf \"%.0f\", $Y}")

  X=$((X + WINDOW_POSITION_X))
  Y=$((Y + WINDOW_POSITION_Y))
  
  mouse_last_position_x=$MOUSE_POSITION_X
  mouse_last_position_y=$MOUSE_POSITION_Y

  if [[ "$IS_WINDOW_ACTIVE" == "true" ]]; then
    xdotool mousemove $X $Y click 1
    xdotool mousemove $mouse_last_position_x $mouse_last_position_y
  fi
}

window_info() {
  WINDOW_ID=$(xdotool getactivewindow)
  WINDOW_NAME=$(xdotool getwindowname $WINDOW_ID)

  IS_WINDOW_ACTIVE=$([ "$TARGET_WINDOW_NAME" == "$WINDOW_NAME" ] && echo "true" || echo "false")
    
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
 
    # echo "
    #   {
    #     mouse_position_y: $MOUSE_POSITION_Y
    #     mouse_position_x: $MOUSE_POSITION_X
    #     window_size_height: $WINDOW_SIZE_HEIGHT
    #     window_size_width: $WINDOW_SIZE_WIDTH
    #     window_position_y: $WINDOW_POSITION_Y
    #     window_position_x: $WINDOW_POSITION_X 
    #   }"
  fi
}

mouse_window_lock() {
  while true; do
  
  window_info

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

  sleep 0.01
  done
}

if [[ $1 == "window-lock" ]]; then
  mouse_window_lock
fi

if [[ $1 == "skill-1" ]]; then
  window_info
  skill_location_q
fi

if [[ $1 == "skill-2" ]]; then
  window_info
  skill_location_w
fi

if [[ $1 == "skill-3" ]]; then
  window_info
  skill_location_e
fi

if [[ $1 == "skill-4" ]]; then
  window_info
  skill_location_r
fi

if [[ $1 == "skill-5" ]]; then
  window_info
  skill_location_d
fi

if [[ $1 == "skill-6" ]]; then
  window_info
  skill_location_f
fi

if [[ $1 == "skill-7" ]]; then
  window_info
  skill_location_g
fi

