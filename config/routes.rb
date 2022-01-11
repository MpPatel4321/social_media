Rails.application.routes.draw do
  get 'friendships/index'
  devise_for :users
  root to: 'deshboard#index'
  resources "deshboard"
  resources "users"
  resources "friendships"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
