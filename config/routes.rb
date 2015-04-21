Rails.application.routes.draw do
  resources :recipes, only: [:index, :new, :create, :show, :destroy] do
    resources :lists, only: [:index, :new, :create, :destroy] do
    end
  end

  resources :ingredients, only: [:index]
  root 'homes#index'
  devise_for :users
end
