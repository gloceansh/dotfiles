#!/bin/bash

sleep 10

API_KEY="YOUR_API_KEY"
LOCATION_DATA=$(curl -sf "http://ip-api.com/json")
LAT=$(echo "$LOCATION_DATA" | jq -r '.lat')
LON=$(echo "$LOCATION_DATA" | jq -r '.lon')
URL="https://api.openweathermap.org/data/2.5/weather?lat=${LAT}&lon=${LON}&appid=${API_KEY}&units=metric"

DATA=$(curl -sf "$URL")
if [ -z "$DATA" ]; then
  sketchybar --set weather label="􁜏 "
  exit 1
fi

TEMP=$(echo "$DATA" | jq '.main.temp' | cut -d "." -f 1)
CONDITION=$(echo "$DATA" | jq -r '.weather[0].main')
CONDITION_DESC=$(echo "$DATA" | jq -r '.weather[0].description')

case "$CONDITION_DESC" in
  "few clouds") ICON="􀇕" ;;
  *)
    case "$CONDITION" in
      Thunderstorm) ICON="􀇟" ;;
      Drizzle)      ICON="􀇅" ;;
      Rain)         ICON="􀇇" ;;
      Snow)         ICON="􀇏" ;;
      Clear)        ICON="􀆮" ;;
      Clouds)       ICON="􀇃" ;;
      Mist|Fog|Haze|Smoke|Dust|Ash|Sand) ICON="􀇣" ;;
      *)            ICON="􀁝" ;;
    esac
    ;;
esac

sketchybar --set weather label="$ICON  ${TEMP}°C"
