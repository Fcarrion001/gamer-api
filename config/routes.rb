# frozen_string_literal: true

Rails.application.routes.draw do
  resources :examples, except: %i[new edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  get '/api-games' => 'games#indexapi'
  get '/api-games/:id' => 'games#showapi'
  # this route will be used when a user tries to add an api_game that already
  # exists in the game table.
  # The game will be found in the games table using the api_id that is readily
  # available.
  get '/games/:api_id' => 'games#find'
  resources :users, only: %i[index show]
  resources :games, only: %i[show index create]
  resources :wanted_games, except: %i[new edit update]
end
