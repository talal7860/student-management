ActiveAdmin.register Student do
  config.comments = false
  collection_action :autocomplete, method: :get do
    students = Student.where('LOWER(name) ILIKE ?', "#{params[:term]}%")
    render json: students, each_serializer: AutocompleteSerializer, root: false
  end

  index do
    selectable_column
    column :name
    column :picture
    column :student_class
    column :dob
    column :email
    column :cnic
    column :gender
    column :address
    column :studying_status
    column :parent_id
    column :branch_id
    column :matric_marks
    column :matric_roll_no
    column :teacher_remarks
    actions
  end

  show do
    attributes_table do
      row :name
      row :picture
      row :student_class
      row :dob
      row :email
      row :cnic
      row :gender
      row :address
      row :studying_status
      row :parent_id
      row :branch_id
      row :matric_marks
      row :matric_roll_no
      row :teacher_remarks
    end
    active_admin_comments
  end

  permit_params :name,
                :picture,
                :student_class,
                :dob,
                :email,
                :cnic,
                :gender,
                :address,
                :studying_status,
                :parent_id,
                :branch_id,
                :teacher_remarks,
                :matric_roll_no,
                :matric_marks,
                :parent_name,
                :parent_email,
                :parent_cnic,
                :parent_phone

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Student Details' do
      f.input :name
      f.input :picture, as: :file
    end
    f.inputs '' do
      f.input :parent_name, label: "Father's name"
      f.input :parent_email, label: "Father's email"
      f.input :parent_cnic, label: "Father's cnic"
      f.input :parent_phone, label: "Father's phone no."
    end
    f.inputs '' do
      f.input :gender
      f.input :student_class, as: :select, collection: [1, 2, 3, 4, 5, 6, 7, 8, 'Hifz']
      f.input :dob, start_year: 1960
      f.input :email
      f.input :cnic
      f.input :address
      f.input :studying_status
      f.input :branch,
              as: :string,
              input_html: {
                class: 'autocomplete',
                id: 'student_branch_name',
                name: '',
                value: f.object.branch.try(:name),
                data: {
                  url: autocomplete_admin_branches_path,
                  hidden_input: '#student_branch_id'
                }
              }
      f.input :branch_id, as: :hidden
      f.input :matric_roll_no
      f.input :matric_marks
    end
    f.actions
  end
end
