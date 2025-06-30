#!/bin/bash

sleep 10

API_KEY="YOUR_API_KEY"
LAT="YOUR_LATITUDE"
LON="YOUR_LONGITUDE"
URL="https://api.openweathermap.org/data/2.5/weather?lat=${LAT}&lon=${LON}&appid=${API_KEY}&units=metric"

DATA=$(curl -sf "$URL")
if [ -z "$DATA" ]; then
  sketchybar --set weather label="􁜏 "
  exit 1
fi

TEMP=$(echo "$DATA" | jq '.main.temp' | cut -d "." -f 1)
CONDITION=$(echo "$DATA" | jq -r '.weather[0].main')

case "$CONDITION" in
  Thunderstorm) ICON="􀇓 " ;;
  Drizzle)      ICON="􀇗 " ;;
  Rain)         ICON="􀇇 " ;;
  Snow)         ICON="􀇏 " ;;
  Clear)        ICON="􀇕 " ;;
  Clouds)       ICON="􀇃 " ;;
  Mist|Fog|Haze|Smoke|Dust|Ash|Sand) ICON="􀇣 " ;;
  *)            ICON="􀁝 " ;;
esac

sketchybar --set weather label="$ICON  ${TEMP}°C"
