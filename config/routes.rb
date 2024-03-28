Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'users#login_form'

  resources :users, only: [:create, :show] do
    resources :user_lists, only: [:new, :create], as: 'lists' do 
      resources :lists, only: [:show, :destroy] do 
        resources :list_items, only: [:create, :destroy] , as: 'items'
      end 
    end
  end

  get '/register', to: 'users#new', as: :new_user
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user' 
  get '/log_out', to: 'users#log_out'

end
