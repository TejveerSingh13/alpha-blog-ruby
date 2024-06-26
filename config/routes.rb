Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#home"

  # Defines other route for the application
  get 'about', to: 'pages#about'

  #Defines routes for DB 
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :articles
  
  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new' #to open the login page ~similar to open a new form
  post 'login', to: 'sessions#create' #to send the login credential to the backend ~similar to submit a new form
  delete 'logout', to: 'sessions#destroy'

  resources :categories, except: [:destroy]

end
