Rails.application.routes.draw do

  namespace :admin do
    resources :book_histories
  end

  namespace :admin do
    resources :books
  end

  resources :book_histories, only: [:index]
  resources :books, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "books#index"
end
