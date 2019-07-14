Rails.application.routes.draw do

  namespace :admin do
    resources :books
    resources :book_histories do
      post 'return', format: false, id: /[0-9]+\/.+/
    end
  end



  resources :book_histories, only: [:index]
  resources :books, only: [:index, :show]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: "books#index"
end
