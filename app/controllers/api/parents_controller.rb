# Parent controller
module Api
  class ParentsController < ApplicationController
    before_filter :authenticate_parent!, except: [:reset_password, :validate_reset_password_token]

    def reset_password
      parent = Parent.reset_password_by_token(reset_password_params)
      unless parent.errors.any?
        render json: { status: 'success' }, status: 200
      else
        render json: { status: 'error', message: parent.errors.full_messages }, status: 422
      end
    end

    def validate_reset_password_token
      if Parent.find_by_token(reset_password_params[:reset_password_token])
        render json: { status: 'success', message: 'Reset token is valid' }
      else
        render json: { status: 'error', message: 'Invalid reset token' }, status: 403
      end
    end

    private

    def reset_password_params
      params.permit(:reset_password_token, :password, :password_confirmation)
    end

  end
end