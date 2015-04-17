Rails.application.routes.draw do
  resources :recipes, only:[:index, :new, :create, :show] do 
    resources :lists, only:[:index, :new, :create, :destroy] do
    end
  end

  resources :ingredients, only:[:index]
  resources :lists, only:[:index, :new, :create]
  root 'homes#index'
  devise_for :users
end
