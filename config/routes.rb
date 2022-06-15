Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'landing', to: 'pages#landing', as: :landing

  resources :my_plants, only: [] do
    member do
      patch :water
    end
    collection do
      post :fetch_api
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :gardens, only: [:show, :new, :create, :destroy, :index] do
    resources :my_plants, only: [:new, :create, :show, :edit, :update, :destroy, :index]
  end
  resources :plants, only: [:new, :create]
end
