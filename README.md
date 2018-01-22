[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# A Game data store and list tracker API

An API that makes requests to a 3rd party API to retrieve game data, store data
that users wish, and view what games are on other User's wishlists.

Visit the [Igdb Documentation](https://igdb.github.io/api/) for more information
about the 3rd party API.

### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl https://salty-brook-97934.herokuapp.com/sign-up \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com"
  }
}
```

#### POST /sign-in

Request:

```sh
curl https://salty-brook-97934.herokuapp.com/sign-in \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com",
    "token": "BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH "https://salty-brook-97934.herokuapp.com/change-password/$ID" \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'
```

```sh
ID=1 OLDPW=hannah NEWPW=elle TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl https://salty-brook-97934.herokuapp.com/sign-out/$ID \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Games

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| GET    | `/api-games`           | `games#indexapi`  |
| GET    | `/api-games/1`         | `games#showapi`   |
| GET    | `/games`               | `games#index`     |
| GET    | `/games/1`             | `games#show`      |
| GET    | `/game/1`              | `games#find`      |
| POST   | `/games`               | `games#create`    |


#### GET /api-games

/api-games makes calls to the 3rd-party API (Igbd), through this API in the games controller.

Request:

```sh
curl https://salty-brook-97934.herokuapp.com/api-games
--include \
--request GET \
--header "Authorization: Token token=$TOKEN"

```

```sh
TOKEN=BAhJIiVhMWZjYTVmYjViODZkZTI4MWVmZjk5YzE4YjgzM2NhMgY6BkVG--68545b5466f64c1fecd0eaae78fa34778ed98164 sh scripts/igbd/get-games.sh

```

Response:

```md
HTTP/1.1 200 OK
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/"8cc0fb892e8b0f6cd0eda6553a75d2c1"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d3055e03-133c-4be9-8832-14ee4d85a8ed
X-Runtime: 0.347920
Vary: Origin
Transfer-Encoding: chunked

[
  {
  "id":58479,
  "name":"Out of Line",
  "url":"https://www.igdb.com/games/out-of-line",
  "summary":"Out of Line is an upcoming platform/action-adventure videogame being
  developed by Duckling Studios, for PlayStation 4 and PC/MAC. \nHelp little San
  and his brothers journey, solve difficult puzzles, alongside action challenges
  in their quest to survive and escape the “factory”.","storyline":"Little San
  woke up in the middle of an factory. Soon he discovered that he isn't alone.
  Far from it. There are several other kids, that look exactly like him! \n \nAt
  the distance, sound of machines are heard. They became closer, and closer,
  louder and louder... All of the sudden, out of nowhere, several hooks appear
  and start picking up everyone! What is this place? Can San and his new found
  brothers escape this devilish environment?",
  "first_release_date":1551571200000,
  "cover":{"url":"//images.igdb.com/igdb/image/upload/t_thumb/v3l0voobqkaucxytkcdf.jpg","cloudinary_id":"v3l0voobqkaucxytkcdf","width":892,"height":1024}
  },
  {
  "id":11774,
  "name":"Occultic;Nine",
  "url":"https://www.igdb.com/games/occultic-nine",
  "summary":"Occultic;Nine is an upcoming Japanese visual novel that is based on
  a light novel of the same name. The game is descibed as a \"Paranormal Science
  Novel\". The story follows nine idiosyncratic individuals. Little incongruities
  that occur around these nine eventually lead to a larger, unimaginable event
  that may alter what is considered common sense in this world. Despite being by
  the same makers and sharing a similar naming scheme, Occultic;Nine is not a part
  of 5pb's Science Adventure series of adventure games.",
  "first_release_date":1510185600000,
  "cover":{"url":"//images.igdb.com/igdb/image/upload/t_thumb/frr8qiwkk0wy5w7lgtgw.jpg",
  "cloudinary_id":"frr8qiwkk0wy5w7lgtgw","width":785,"height":920
  }
]
```

#### GET api-games/:id

Request:

```sh
curl https://salty-brook-97934.herokuapp.com/api-games/${ID}
--include \
--request GET \
--header "Authorization: Token token=$TOKEN"
```

```sh
$ ID=27920 TOKEN=BAhJIiVhMWZjYTVmYjViODZkZTI4MWVmZjk5YzE4YjgzM2NhMgY6BkVG--68545b5466f64c1fecd0eaae78fa34778ed98164 sh scripts/igbd/show-game.sh
```

Response:

```md
HTTP/1.1 200 OK
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/"86ad967ac6fef601e981fc64d10cb81b"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4e67e74e-aa34-479a-97ef-de589f015d59
X-Runtime: 0.392754
Vary: Origin
Transfer-Encoding: chunked

[
{
"id":27920,
"name":"Digimon Story: Cyber Sleuth - Hacker’s Memory",
"url":"https://www.igdb.com/games/digimon-story-cyber-sleuth-hackers-memory",
"summary":"Game for PlayStation 4 and Vita.",
"storyline":"\"Set in the near future, the line between the real and digital
worlds is blurred and logging into cyberspace is a part of everyday life. In the
shadows lurk hackers utilizing computer viruses called Digimon to commit mischief
and crimes. \n \nFramed and accused of wrongdoings, Keisuke Amazawa has no choice
but to dive into the digital world to not only clear his name and prove his
innocence, but to protect his loved ones.\"",
"first_release_date":1513209600000,
"cover":{"url":"//images.igdb.com/igdb/image/upload/t_thumb/laxddv3tcngamkufq1ak.jpg",
"cloudinary_id":"laxddv3tcngamkufq1ak","width":1200,"height":1326}
}]
```

#### GET /games

Request:

```sh
curl https://salty-brook-97934.herokuapp.com/games
--include \
--request GET \
--header "Content-Type: application/json"
```
```sh
sh scripts/games/get-games.sh
```

Response:

```md
HTTP/1.1 200 OK
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/"6bc6832050512beb3c79b3abf9d0ac78"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7b5414e8-3bab-429b-bd16-9a1187853bb7
X-Runtime: 0.092695
Vary: Origin
Transfer-Encoding: chunked

{
"games": [
{
"id": 1,
"game_name": "Kingdom Under Fire II",
"platform": "playstation",
"release_date": "2018-03-30",
"api_id": 6414,
"totalAdds": 1,
"storyline": null,
"summary": "Kingdom Under Fire II merges real-time strategy (RTS), role-playing
game (RPG) and massively multiplayer online game (MMO) genres - the game is to
have a single player, and online multiplayer mode. The game follows on
chronologically from Kingdom Under Fire: Circle of Doom, and is the first RTS
game set in the Kingdom Under Fire universe to be released since the 2005
Kingdom Under Fire: Heroes. \n \nThe game was announced in January 2008, and has
been subject to delay and changes to release platforms; A closed beta-test began
in December 2011 in South Korea. \n \nIn November 2013, the developers announced
that a version for the PlayStation 4 was in development.",
"url": "https://www.igdb.com/games/kingdom-under-fire-ii",
"screenshot": "https:https://igdb.spacechop.com/igdb/image/upload/t_thumb/uzzbpbjkxko02u2c18lu.jpg",
"cloudinary_id": "uzzbpbjkxko02u2c18lu"
},
{
"id": 2,
"game_name": "Detroit: Become Human",
"platform": "playstation",
"release_date": "2018-06-29",
"api_id": 14362,
"totalAdds": 1,
"storyline": null,
"summary": "Detroit: Become Human is an neo-noir thriller. The plot revolves
around three androids: Kara, who escapes the factory she was made in to explore
her newfound sentience; Connor, whose job it is to hunt down deviant androids
like Kara; and Markus, who devotes himself to releasing the androids from
servitude. The characters may survive or perish depending on the choices that
are made, which serve to shape the story as customised by the player.",
"url": "https://www.igdb.com/games/detroit-become-human--1",
"screenshot": "https://images.igdb.com/igdb/image/upload/t_thumb/fpcxgdnsjyvhbydznfin.jpg",
"cloudinary_id": "fpcxgdnsjyvhbydznfin"
}
```

#### GET games/:id

Request:

```sh
curl https://salty-brook-97934.herokuapp.com/games/${ID}
--include \
--request GET \
--header "Content-Type: application/json"
```

```sh
ID=1 sh scripts/games/show-game.sh
```
Response:

```md
HTTP/1.1 200 OK
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/"6bc6832050512beb3c79b3abf9d0ac78"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7b5414e8-3bab-429b-bd16-9a1187853bb7
X-Runtime: 0.092695
Vary: Origin
Transfer-Encoding: chunked

{
"games": [
{
"id": 1,
"game_name": "Kingdom Under Fire II",
"platform": "playstation",
"release_date": "2018-03-30",
"api_id": 6414,
"totalAdds": 1,
"storyline": null,
"summary": "Kingdom Under Fire II merges real-time strategy (RTS), role-playing
game (RPG) and massively multiplayer online game (MMO) genres - the game is to
have a single player, and online multiplayer mode. The game follows on
chronologically from Kingdom Under Fire: Circle of Doom, and is the first
RTS game set in the Kingdom Under Fire universe to be released since the 2005
Kingdom Under Fire: Heroes. \n \nThe game was announced in January 2008, and has
been subject to delay and changes to release platforms; A closed beta-test began
in December 2011 in South Korea. \n \nIn November 2013, the developers announced
that a version for the PlayStation 4 was in development.",
"url": "https://www.igdb.com/games/kingdom-under-fire-ii",
"screenshot": "https:https://igdb.spacechop.com/igdb/image/upload/t_thumb/uzzbpbjkxko02u2c18lu.jpg",
"cloudinary_id": "uzzbpbjkxko02u2c18lu"
}
```
#### GET /game/:api_id

The `find` GET requests and responses are identical to `show` except for the
difference in the route. This route serves as a redirect in the event that the
`create` game action is unsuccessful due to a violation of the api_id uniqueness
validator.  This allows access to the id of the existing game to be used for the
ultimate goal of posting to the wanted_games table.



#### POST /games

Games should only be created using the data retrieved from the 3rd party API.
However, should the need arise, this is the method to create a game manually
using a curl script.

Request:

```sh
curl https://salty-brook-97934.herokuapp.com/games \
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
```
```sh
TOKEN=BAhJIiU2Y2QyMTZiYjE0OGQyNjdjNmVkOGRhY2M0M2UyMjQ2ZQY6BkVG--62d9946fbb4b2d7baa34e01cad727b60aeb89a3a
APIID=37016 NAME="Metro Exodus" URL="https://www.igdb.com/games/metro-exodus"
SUMMARY="Metro Exodus is an epic, story-driven first person shooter from 4A
Games that blends deadly combat and stealth with exploration and survival horror
in one of the most immersive game worlds ever created. Explore the Russian
wilderness across vast, non-linear levels and follow a thrilling story-line that
spans an entire year through spring, summer and autumn to the depths of nuclear
winter. Inspired by the novels of Dmitry Glukhovsky, Metro Exodus continues
Artyom’s story in the greatest Metro adventure yet" DATE=1546214400000 SS="//images.igdb.com/igdb/image/upload/t_thumb/r8fpmxloce7eobtksodk.jpg"
CLOUD="r8fpmxloce7eobtksodk" PLATFORM="playstation 4" sh scripts/games/create-game.sh
```
Response:

`Epoch` dates need to be converted to a standard format prior to submission or it will be recorded as `null`.
```md
HTTP/1.1 201 Created
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Location: http://localhost:4741/games/6
Content-Type: application/json; charset=utf-8
ETag: W/"32dbb7161ba48782700d18d88da5ff93"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f1e4b8db-80b8-4639-bcda-ec67063efe70
X-Runtime: 0.098647
Vary: Origin
Transfer-Encoding: chunked

{
"game":{
"id":6,
"game_name":"Metro Exodus",
"platform":"playstation 4",
`"release_date":null`,
"api_id":37016,
"totalAdds":1,
"storyline":"",
"summary":"Metro Exodus is an epic, story-driven first person shooter from 4A Games
 that blends deadly combat and stealth with exploration and survival horror in
 one of the most immersive game worlds ever created. Explore the Russian wilderness
 across vast, non-linear levels and follow a thrilling story-line that spans an
 entire year through spring, summer and autumn to the depths of nuclear winter.
 Inspired by the novels of Dmitry Glukhovsky, Metro Exodus continues Artyom’s
 story in the greatest Metro adventure yet",
 "url":"https://www.igdb.com/games/metro-exodus",
 "screenshot":"//images.igdb.com/igdb/image/upload/t_thumb/r8fpmxloce7eobtksodk.jpg",
 "cloudinary_id":"r8fpmxloce7eobtksodk"
  }
 }
```

OR, if the game's api_id fails the uniqueness test

```md
HTTP/1.1 302 Found
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Location: http://localhost:4741/game/37016
Content-Type: text/html; charset=utf-8
Cache-Control: no-cache
X-Request-Id: d2fd11f6-2109-493c-9822-a45d0f82a967
X-Runtime: 0.010300
Vary: Origin
Transfer-Encoding: chunked

<html><body>You are being <a href="http://localhost:4741/game/37016">redirected</a>.</body></html>
```
### Wanted_Games

Wanted_Games is a join table between Users and Games.
All requests require authentication in order for a successful action to occur.

| Verb   | URI Pattern            | Controller#Action        |
|--------|------------------------|--------------------------|
| GET    | `/wanted_games`        | `wanted_games#index`     |
| GET    | `/wanted_games/1`      | `wanted_games#show`      |
| POST   | `/wanted_games`        | `wanted_games#create`    |
| DELETE | `/wanted_games/1`      | `wanted_games#destroy`   |

#### GET /wanted_games

An `index` request for `/wanted_games` will return all wanted games associated
with the user making the request.

#### GET /wanted_games/:id

User must be the owner of the `wanted_game` in order to view it. Otherwise a
`404 Unauthorized` error will be returned.

#### POST /wanted_Games

The id of the `game` is needed in order to make a `POST` to `wanted_games`


#### DELETE /wanted_games/:id

The id of the `wanted_game` is needed for deletion.

## Links

[`Deployed API`](https://salty-brook-97934.herokuapp.com)

[`Game-Tracker-Client`](https://github.com/Fcarrion001/game-tracker-client)(Repo to web app that I built using this API for requests.)

## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.
