Rails.application.routes.draw do
  root 'sessions#home'

  get '/signup' => 'users#new'
  post 'signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'
  get 'cards/most_commented' => 'cards#most_commented'
  
  get "/auth/:provider/callback", to: 'sessions#google'

  resources :comments
  resources :users do
    resources :cards, only: [:new, :create, :index, :edit, :update, :destroy]
  end
  resources :cards do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
