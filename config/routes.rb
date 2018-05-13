Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/readme',    to: 'static_pages#readme'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  post    '/signup',  to: 'users#create'
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  get   '/users/admin',     to: 'users#admin'
  resources :users
  resources :microposts,          only: [:create, :destroy]
end
