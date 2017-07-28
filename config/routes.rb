Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  devise_for :users
  root to: "static_pages#index"
  resources :posts
  resources :tags
  resources :relationships, only: [:create, :destroy]
  resources :comments
end
