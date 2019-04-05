Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated  do
      root 'home#index'
    end
    unauthenticated do
      root 'devise/sessions#new'
    end
  end
  resources :projects do
    resources :todos
  end
  resources :projects_users
  get 'admin', to: 'home#admin'
  get 'developer', to: 'home#developer'
end
