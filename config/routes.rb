# frozen_string_literal: true
Rails.application.routes.draw do

  resources :examples, except: %i[new edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: %i[index show]
  resources :games, only: %i[show index]
  resources :wanted_games, except: %i[new edit update]
end
