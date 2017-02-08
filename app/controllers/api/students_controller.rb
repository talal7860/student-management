module Api
  #module Parents
    class StudentsController < ApplicationController
      def index
        render json: Parent.first.students
      end
    end
  #end
end