module Api
  class Parents::StudentsController < Api::ApplicationController
    before_action :authenticate_parent!, except: [:new, :create]
    def index
      @students = current_parent.students
      render json: @students.page(params[:page]).per(10)
    end
  end
end
