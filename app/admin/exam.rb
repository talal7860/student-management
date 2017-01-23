ActiveAdmin.register Exam do
  collection_action :autocomplete, method: :get do
    exam = Exam.where('LOWER(name) ILIKE ?', "#{params[:term]}%")
    render json: exam, each_serializer: AutocompleteSerializer, root: false
  end

  index do
    selectable_column
    column :course_id
    column :teacher_id
    column :student_id
    column :exam_type
    column :total_marks
    column :marks_obtained
    actions
  end
  show do
    attributes_table do
      row :course_id
      row :teacher_id
      row :student_id
      row :exam_type
      row :total_marks
      row :marks_obtained
    end
    active_admin_comments
  end

  permit_params :course_id,
                :teacher_id,
                :student_id,
                :exam_type,
                :total_marks,
                :marks_obtained
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Exam Details' do
      f.input :course,
              as: :string,
              input_html:
              {
                class: 'autocomplete',
                id: 'exam_course_name',
                name: '',
                value: f.object.course.try(:name),
                data: {
                  url: autocomplete_admin_courses_path,
                  hidden_input: '#exam_course_id'
                }
              }
      f.input :course_id, as: :hidden
      f.input :teacher,
              as: :string,
              input_html:
              {
                class: 'autocomplete',
                id: 'exam_teacher_name',
                name: '',
                value: f.object.teacher.try(:name),
                data: {
                  url: autocomplete_admin_teachers_path,
                  hidden_input: '#exam_teacher_id'
                }
              }
      f.input :teacher_id, as: :hidden
      f.input :student,
              as: :string,
              input_html:
              {
                class: 'autocomplete',
                id: 'exam_student_name',
                name: '',
                value: f.object.student.try(:name),
                data: {
                  url: autocomplete_admin_students_path,
                  hidden_input: '#exam_student_id'
                }
              }
      f.input :student_id, as: :hidden
      f.input :exam_type
      f.input :total_marks
      f.input :marks_obtained
    end
    f.actions
  end
end
