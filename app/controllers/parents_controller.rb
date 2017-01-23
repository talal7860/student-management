# Parent controller
class ParentsController < AppController
  def index
    @students = current_user.students
    @students = @students.paginate(:page => params[:page], :per_page => 30)
  end
end
