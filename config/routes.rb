Rails.application.routes.draw do
  root 'outputs#dashboard'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # ログイン関連(利用しない機能のルーティングは削除する)
  devise_for :users, controllers: {
    sessions:      "users/sessions",
    passwords:     "users/passwords",
    registrations: "users/registrations"
  }
  devise_scope :user do
    # simple Login
    post "simple_login", to: "users/sessions#user_simple_login"
  end


  resources :outputs, except: [:destroy] do
    # ダッシュボード画面
    collection do
      get :dashboard
    end
  end

  get "skills/edit", to: "skills#edit"
  post "user_skills", to: "user_skills#create"
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end