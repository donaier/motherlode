Rails.application.routes.draw do

  root 'pages#home'

  get 'gallery',  to: :gallery, controller: 'pages',    path: 'expo'
  get 'who',      to: :who,     controller: 'pages'
  get 'zhaw',     to: :zhaw,    controller: 'pages'


  scope 'zhaw' do
    devise_for :users, :controllers => { :registrations => :registrations }
    resources :documents, only: [:new, :create, :edit, :update, :index]
    resources :group_documents do
      resources :group_comments, only: [:new, :create, :edit, :update, :destroy]
    end
    scope 'documents' do
      get 'archive', to: :archive, controller: 'documents'
    end
    resources :calendar_entries, only: [:new, :create, :edit, :update, :index] do
      get 'show_for_date', on: :collection
    end
    resources :user_requests, only: [:create, :index, :destroy]
    resources :users, only: :index
  end

  resources :images, only: [:new, :create, :edit, :update, :destroy, :index]
end
