Rails.application.routes.draw do
  resources :messages, only: [:index]
  root 'messages#index'

  mount ActionCable.server => '/cable'
end