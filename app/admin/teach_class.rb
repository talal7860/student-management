ActiveAdmin.register TeachClass do
  config.comments = false
  collection_action :autocomplete, method: :get do
    parent = Parent.where('LOWER(name) ILIKE ?', "#{params[:term]}%")
    render json: parent, each_serializer: AutocompleteSerializer, root: false
  end

  index do
    selectable_column
    column :teacher_id
    column :student_year
    column :course_id
    column :branch_id
    actions
  end

  show do
    attributes_table do
      row :teacher_id
      row :student_year
      row :course_id
      row :branch_id
    end
    active_admin_comments
  end

  permit_params :teacher_id, :student_year, :course_id, :branch_id

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Class Details' do
      f.input :teacher,
              as: :string,
              input_html: {
                class: 'autocomplete',
                id: 'teach_class_teacher_name',
                name: '',
                value: f.object.teacher.try(:name),
                data: {
                  url: autocomplete_admin_teachers_path,
                  hidden_input: '#teach_class_teacher_id'
                }
              }
      f.input :teacher_id, as: :hidden
      f.input :student_year, as: :select, collection: [1, 2, 3, 4, 5, 6, 7, 8, 'Hifz']
      f.input :course,
              as: :string,
              input_html: {
                class: 'autocomplete',
                id: 'course_name',
                name: '',
                value: f.object.course.try(:name),
                data: {
                  url: autocomplete_admin_courses_path,
                  hidden_input: '#teach_class_course_id'
                }
              }
      f.input :course_id, as: :hidden
      f.input :branch,
              as: :string,
              input_html: {
                class: 'autocomplete',
                id: 'teach_class_branch_name',
                name: '',
                value: f.object.branch.try(:name),
                data: {
                  url: autocomplete_admin_branches_path,
                  hidden_input: '#teach_class_branch_id'
                }
              }
      f.input :branch_id, as: :hidden
    end
    f.actions
  end
end
