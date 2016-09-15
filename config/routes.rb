Rails.application.routes.draw do
  resources :player

  get 'search', to: 'player#search'

  get 'play', to: 'player#play'

end
