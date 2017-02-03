Rails.application.routes.draw do
  devise_for :teachers
  # devise_for :parents
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # root 'api#parents'
  mount_devise_token_auth_for 'Parent', at: 'api'
  # mount_devise_token_auth_for 'Teacher', at: 'auth'
  resources :students

  namespace :api do
    resources :parents do
      collection do
        post :reset_password
        post :validate_reset_password_token
      end
    end
  end
end
