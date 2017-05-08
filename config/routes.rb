Rails.application.routes.draw do
  get 'pages/home'

  get 'pages/about'

  get 'tickets/index'

  get 'tickets/show'

  get 'tickets/new'

  get 'tickets/create'

  get 'tickets/edit'

  get 'tickets/update'

  get 'tickets/destroy'

  get 'events/index'

  get 'events/show'

  get 'events/new'

  get 'events/create'

  get 'events/edit'

  get 'events/update'

  get 'events/destroy'

  get 'organizers/index'

  get 'organizers/show'

  get 'organizers/new'

  get 'organizers/create'

  get 'organizers/edit'

  get 'organizers/update'

  get 'organizers/destroy'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
