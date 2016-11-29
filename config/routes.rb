Rails.application.routes.draw do

  devise_for :users,
             controllers: {
               sessions: 'users/sessions'
             }

  resources :users

  resources :documents, except: :new

  resources :rooms, only: [] do
    resources :finishes
  end

  resources :developments do
    resources :phases
    resources :unit_types
    resources :rooms
    resources :plots
  end

  resources :developers do
    resources :divisions
    resources :developments
  end

  resources :divisions do
    resources :developments
  end

  root 'dashboard#show'
end
