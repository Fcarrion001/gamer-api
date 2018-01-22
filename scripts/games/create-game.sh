#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/games"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "game": {
      "game_name": "'"${NAME}"'",
      "platform": "'"${PLATFORM}"'",
      "release_date": "'"${DATE}"'",
      "cloudinary_id": "'"${CLOUD}"'",
      "screenshot": "'"${SS}"'",
      "api_id": "'"${APIID}"'",
      "storyline": "'"${STORY}"'",
      "summary": "'"${SUMMARY}"'",
      "url": "'"${URL}"'"
    }
  }'

echo
