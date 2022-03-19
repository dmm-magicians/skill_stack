Rails.application.routes.draw do
  root 'outputs#dashboard'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :outputs, except: [:destroy] do
    # ダッシュボード画面
    collection do
      get :dashboard
    end
  end
  resources :user_skills
  resources :skills
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
