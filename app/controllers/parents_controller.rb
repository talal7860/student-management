# Parent controller
class ParentsController < AppController
  def index
    @students = current_user.students
    @student = @students.page(params[@students]).per(10)
  end
end
