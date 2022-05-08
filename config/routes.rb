Rails.application.routes.draw do
  resources :messages, :only => [:create]
  resources :talks, :only => [:create, :show, :index]
  resources :blogs, only: [:create, :index]
  resources :lifestyles do
    resources :comment_lifestyles, only: [:create, :destroy]
  end
  get 'subhome/index'
  resources :works do
    resources :comment_works, only: [:create, :destroy]
  end
  resources :normals do
    resources :comments, only: [:create, :destroy]
  end
  get 'search' => 'rooms#search'
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: "home#index"
  resources :users
  resources :rooms do
    resource :favorites, only: [:create, :destroy]
  end
  resources :reservations

end
