require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'users#login_form'

  resources :users, only: [:create, :show, :edit, :update] do
    resources :lists, only: [:index, :show, :destroy, :new, :create] do 
      resources :list_items, only: [:create, :destroy] , as: 'items'
    end 
  end

  get '/register', to: 'users#new', as: :new_user
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user' 
  delete '/log_out', to: 'users#log_out'

end
