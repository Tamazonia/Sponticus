Rails.application.routes.draw do



  get 'purchases/new'

  get 'purchases/create'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events
  resources :users, only: [:show]


  resources :events do
    resources :tickets do
      resources :purchases, only: [:new, :create]
    end
  end
end
