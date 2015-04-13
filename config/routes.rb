Rails.application.routes.draw do
  resources :recipes, only:[:index, :new, :create, :show] do 
    resources :ingredients, only:[:index, :new, :create] do
    end
  end

  resources :ingredients, only:[:index]
  root 'homes#index'
  devise_for :users
end
