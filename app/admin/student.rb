ActiveAdmin.register Student do
  collection_action :autocomplete, method: :get do
    students = Student.where('LOWER(name) ILIKE ?', "#{params[:term]}%")
    render json: students, each_serializer: AutocompleteSerializer, root: false
  end

  controller do
    def permitted_params
      permit_params :name, :email, :cnic, :phone
    end
  end
  permit_params :name,
  :picture,
  :student_class,
  :dob,
  :email,
  :cnic,
  :address,
  :studying_status,
  :parent_id,
  :branch_id,
  :teacher_remarks,
  :matric_roll_no,
  :matric_marks

  

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Student Details' do
      f.input :name
      f.input :picture, :as => :file
    end
    f.inputs '', for:[:parent, f.object.parent] do |s|
        s.input :name, label: "Father's name"
        s.input :email, label: "Father's email"
        s.input :cnic, label: "Father's cnic"
        s.input :phone, label: "Father's phone no."
        s.actions
    end
    f.inputs '' do
      f.input :student_class, as: :select, collection: [1,2,3,4,5,6,7,8]
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
          hidden_input: "#student_branch_id"
        },
      }
      f.input :branch_id, as: :hidden
      f.input :matric_roll_no
      f.input :matric_marks
      end
      f.actions
    end
  end
