Rails.application.routes.draw do

  root 'pages#home'

  get 'gallery', to: :gallery, controller: 'pages'
  get 'who', to: :who, controller: 'pages'

  if Rails.env == 'development'
    resources :images, only: [:new, :create, :edit, :update, :destroy]
  end
end
