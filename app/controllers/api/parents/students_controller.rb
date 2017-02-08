module Api
  class Parents::StudentsController < Api::ApplicationController
    before_action :authenticate_parent!
    def index
      @students = current_parent.students
      render json: @students.page(params[@students]).per(10)
      # render json: current_parent.students.to_json
    end
  end
end