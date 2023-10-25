Rails.application.routes.draw do

  get 'inventories/index'
  get 'inventories/show'
  get 'inventories/new'
  get 'inventories/edit'
  get 'inventories/create'
  resources :inventories

  root 'inventories#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
