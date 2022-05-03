Rails.application.routes.draw do
  resources :blogs
  resources :lifestyles
  get 'subhome/index'
  resources :works
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
