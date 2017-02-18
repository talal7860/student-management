Rails.application.routes.draw do
  devise_for :teachers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # root 'api#parents'
  mount_devise_token_auth_for 'Parent', at: 'auth-parent'

  namespace :api do
    resources :parents do
      collection do
        post :reset_password
        post :validate_reset_password_token
        scope module: 'parents' do
          resources :students
        end
      end
    end
  end
end
