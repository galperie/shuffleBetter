Rails.application.routes.draw do
  resources :songs
  resources :player

  root 'player#index'

  get 'search', to: 'player#search'

  get 'play', to: 'player#play'
end
