ActiveAdmin.register Fee do
  permit_params :student_id, :amount, :pay_date, :scholarship, :pay_status

  index do
    selectable_column
    column :student_id
    column :amount
    column :pay_date
    column :scholarship
    column :pay_status
    actions
  end
  show do
    attributes_table do
      row :student_id
      row :amount
      row :pay_date
      row :scholarship
      row :pay_status
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Fees Details' do
      f.input :student,
              as: :string,
              input_html:
              {
                class: 'autocomplete',
                id: 'post_student_name',
                name: '',
                value: f.object.student.try(:name),
                data:
                {
                  url: autocomplete_admin_students_path,
                  hidden_input: '#fee_student_id'
                }
              }
      f.input :student_id, as: :hidden
      f.input :amount
      f.input :pay_date
      f.input :scholarship
      f.input :pay_status
    end
    f.actions
  end
end
