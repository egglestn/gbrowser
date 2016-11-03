Rails.application.routes.draw do
  resources :developments
  resources :developers
  root 'dashboard#show'
end
