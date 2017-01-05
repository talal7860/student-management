ActiveAdmin.register Student do
  permit_params :name,
  :picture,
  :student_class,
  :dob,
  :email,
  :cnic,
  :address,
  :studying_status,
  # :user_id,
  # :branch_id,
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
      # f.input :user_id
      # f.input :branch_id
      f.input :matric_roll_no
      f.input :matric_marks
      end
      f.actions
    end
  end
