Rails.application.routes.draw do

  root 'pages#home'

  get 'gallery',  to: :gallery, controller: 'pages',    path: 'expo'
  get 'who',      to: :who,     controller: 'pages'

  get 'zhaw', to: 'documents#index'
  scope 'zhaw' do
    devise_for :users, :controllers => { :registrations => :registrations }
    resources :documents, only: [:new, :create, :edit, :update, :destroy, :index]
  end

  if Rails.env == 'development'
    resources :images, only: [:new, :create, :edit, :update, :destroy, :index]
  end
end
