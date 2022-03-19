Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # ログイン関連(利用しない機能のルーティングは削除する)
  devise_for :users, controllers: {
  sessions:      "users/sessions",
  passwords:     "users/passwords",
  registrations: "users/registrations"
  }
  # simple Login
  post "simple_login", to: "users#user_simple_login"


  resources :outputs
  resources :user_skills
  resources :skills
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
