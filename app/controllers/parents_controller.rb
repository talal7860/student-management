# Parent controller
class ParentsController < AppController
  def index
    @students = current_user.students
    @students = @students.page(params[@students]).per(10)
  end
end
