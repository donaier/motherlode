Rails.application.routes.draw do
  root 'pages#home'

  get 'gallery', to: :gallery, controller: 'pages'
  get 'who', to: :who, controller: 'pages'

end
