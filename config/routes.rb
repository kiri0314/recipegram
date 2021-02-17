Rails.application.routes.draw do
  get 'favorites', to: 'favorites#index'
  devise_for :users
  root to: "home#index"
  resources :users
  resources :recipes do
    resource :favorites, only: [:create, :destroy]
  end  

end
