Rails.application.routes.draw do

  namespace :admin do
    resources :books
    resources :book_histories
  end

  # get '/admin/book_histories/borrow', to: 'admin/book_histories#borrow'
  #   patch "admin/books" => "admin#usersupdate", :as => "admin/usersupdate"

  resources :book_histories, only: [:index]
  resources :books, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "books#index"
end
