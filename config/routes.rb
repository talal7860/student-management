Rails.application.routes.draw do
  devise_for :teachers
  devise_for :parents
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
