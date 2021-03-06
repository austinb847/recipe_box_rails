Rails.application.routes.draw do
  root to: 'recipes#index'
  resources :recipes do
    resources :tags
  end
  resources :tags do
    resources :recipes
  end

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

end
