Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'store', to: 'pages#store'
  resources :contacts, only: :create
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
  resources :articles
  resources :posts
  resources :quarks
end
