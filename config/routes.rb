Rails.application.routes.draw do
  resources :developments do
    resources :phases
  end

  resources :developers
  root 'dashboard#show'
end
