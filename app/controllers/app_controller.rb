# app controller
class AppController < ApplicationController
  before_filter :authenticate_user!

  protected

  def authenticate_user!
    if current_parent.present?
      @user = current_parent
    elsif current_teacher.present?
      @user = current_teacher
    else
      authenticate_parent!
    end
  end

  def current_user
    @user
  end
end
