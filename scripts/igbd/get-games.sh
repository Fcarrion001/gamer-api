#!/bin/bash
curl http://localhost:4741/game-api \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
