Rails.application.routes.draw do


  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #resources :events
  resources :users, only: [:show]
  resources :organizers
  resources :orders, only: [:show, :create, :update] do
    resources :payments, only: [:new, :create]
  end


  resources :events do
    resources :tickets do
    end
  end


  # When I still had a Purchase model before Stripe:
  # resources :events do
  #   resources :tickets do
  #     resources :purchases, only: [:new, :create]
  #   end
  # end

  get :send_confirmation_mail, to: "orders#send_confirmation_mail", as: :send_confirmation_mail

end
