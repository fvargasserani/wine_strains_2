Rails.application.routes.draw do
  resources :magazines
  resources :oenologists
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :strains
  resources :wines
  root 'wines#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
