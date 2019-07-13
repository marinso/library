Rails.application.routes.draw do

  namespace :admin do
    resources :books
    resources :book_histories do
      post 'return', format: false, id: /[0-9]+\/.+/
    end
  end
  # namespace :admin do
  #   post '/return', to: 'book_histories#return' ,format: false, id: /[0-9]+\/.+/
  # end


  resources :book_histories, only: [:index]
  resources :books, only: [:index, :show]
  devise_for :users
  root to: "books#index"
end
