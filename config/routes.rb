# == Route Map
#
# Prefix Verb  URI Pattern Controller#Action
#   root GET   /           pages#index
#        PATCH /           pages#update
#        PUT   /           pages#update
#

Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "pages#index"
  patch '/' => "pages#update"
  put '/' => "pages#update"
  get '/current' => "pages#show"
  post '/users' => "users#create"

  post '/login' => "session#create"
  delete '/login' => "session#destroy"

  get '/lineup' => "pages#lineup"

  mount ActionCable.server, at: '/cable'
end
