Rails.application.routes.draw do

  root 'pages#home'

  get 'gallery', to: :gallery, controller: 'pages', path: 'expo'
  get 'who', to: :who, controller: 'pages'

  get 'zhaw', to: :zhaw, controller: 'pages'
  scope 'zhaw' do
    resources :documents, only: [:new, :create, :edit, :update, :destroy]
  end

  if Rails.env == 'development'
    resources :images, only: [:new, :create, :edit, :update, :destroy, :index]
  end
end
