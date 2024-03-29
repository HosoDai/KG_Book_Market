Rails.application.routes.draw do
  devise_for :users
  root to: "home#top"
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :favorites
    end
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
  end
  get "about" => "home#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
