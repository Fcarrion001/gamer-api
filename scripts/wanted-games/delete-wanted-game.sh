API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/wanted_games"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN"
