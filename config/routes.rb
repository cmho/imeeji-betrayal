Rails.application.routes.draw do
  root to: 'run#index'
  resources :character
  get 'run/new', to: 'run#new'
  post 'run/create', to: 'run#create'
  post 'run/update', to: 'run#update'
  get 'run/:id/edit', to: 'run#edit'
  get 'run/:id', to: 'run#show'
  post 'update_location', to: 'run#change_location'
  post 'modify_stats', to: 'run#modify_stats'
  post 'add_item', to: 'run#add_item'
  post 'discard_item', to: 'run#discard_item'
end
