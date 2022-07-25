Rails.application.routes.draw do
  devise_for :users
  root to: "home#top"
  resources :users
  get "about" => "home#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
