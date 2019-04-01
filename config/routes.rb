Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  root to: 'main#index'

  resources :likes
  # why is this plural and not 'like'
  # root to: 'likes#index'

end
