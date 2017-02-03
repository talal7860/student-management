# Application Controller
module Api
  class ApplicationController < ActionController::Base
    # protect_from_forgery with: :exception
    include DeviseTokenAuth::Concerns::SetUserByToken
  end
end