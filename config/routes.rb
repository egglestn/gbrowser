Rails.application.routes.draw do

  devise_scope :user do
    get '/admin', to: "users/sessions#new"
  end
  devise_for :users,
             controllers: {
               sessions: 'users/sessions'
             }

  resources :users, :samples

  resources :documents, except: :new

  get "/admin/dashboard", to: 'admin/dashboard#show', as: :admin_dashboard
  get "/dashboard", to: 'user/dashboard#show', as: :user_dashboard
  root 'home#show'
end
