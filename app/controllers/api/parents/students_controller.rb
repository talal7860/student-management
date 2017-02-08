module Api
  class Parents::StudentsController < Api::ApplicationController
    #include DeviseTokenAuth::Concerns::SetUserByToken
    before_action :authenticate_parent!
    def index
      render json: current_parent.students.to_json
    end
  end
end