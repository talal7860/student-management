ActiveAdmin.register Student do
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
      f.input :picture, :as => :file #, :hint => f.template.image_tag(f.object.image.url(:medium))
      f.input :student_class, as: :select, collection: [1,2,3,4,5,6,7,8]
      f.input :dob, start_year: 1960
      f.input :email
      f.input :cnic
      f.input :address
      f.input :studying_status
      f.input :parent,
      as: :string,
      input_html: {
        class: 'autocomplete',
        id: 'post_user_name',
        name: '',
        value: f.object.user.try(:name),
        data: {
          url: autocomplete_admin_users_path,
          hidden_input: "#student_parent_id"
        },
      }
      f.input :parent_id, as: :hidden
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
