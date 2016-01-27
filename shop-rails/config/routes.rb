Rails.application.routes.draw do
  root to: 'items#index'

  get 'admin', to: 'items#admin'
  post 'checkout', to: 'items#checkout'
end
