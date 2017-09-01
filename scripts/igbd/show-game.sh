#!/bin/bash
curl http://localhost:4741/api-games/${ID} \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
