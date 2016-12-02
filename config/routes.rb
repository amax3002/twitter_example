Rails.application.routes.draw do
  resources :tweets
  resource :session, only: [:new, :create, :destroy]
  resources  :users, except: [:index]

  root "homepage#index"
end
