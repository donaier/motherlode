Rails.application.routes.draw do

  root 'pages#home'

  get 'gallery',  to: :gallery, controller: 'pages',    path: 'expo'
  get 'who',      to: :who,     controller: 'pages'
  get 'zhaw',     to: :zhaw,    controller: 'pages'

  scope 'zhaw' do
    devise_for :users, :controllers => { :registrations => :registrations }
    resources :documents, only: [:new, :create, :edit, :update, :index]
    resources :calendar_entries, only: [:new, :create, :edit, :update, :index] do
      get 'show_for_date', on: :collection
    end
  end

  resources :images, only: [:new, :create, :edit, :update, :destroy, :index]
end
