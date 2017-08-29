#!/bin/bash

curl --include --request POST http://localhost:4741/wanted_games \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "wanted_game": {
      "user_id":"'"${USER_ID}"'",
      "game_id":"'"${GAME_ID}"'"
    }
  }'
