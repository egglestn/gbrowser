Rails.application.routes.draw do
  resources :developments do
    resources :phases
    resources :unit_types
  end

  resources :developers
  root 'dashboard#show'
end
