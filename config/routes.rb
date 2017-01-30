Rails.application.routes.draw do
  # devise_for :teachers
  # devise_for :parents
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # root 'parents#index'
  mount_devise_token_auth_for 'Parent', at: 'auth'
  # mount_devise_token_auth_for 'Teacher', at: 'auth'
  resources :students
end
