Rails.application.routes.draw do
  resources :developers
  root 'dashboard#show'
end
