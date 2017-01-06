ActiveAdmin.register Fee do
  permit_params :student_id,:amount,:pay_date,:scholarship,:pay_status

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Fees Details" do
      f.input :student,
      as: :string,
      input_html: {
        class: 'autocomplete',
        id: 'post_student_name',
        name: '',
        value: f.object.student.try(:name),
        data: {
          url: autocomplete_admin_students_path,
          hidden_input: "#fee_student_id"
        },
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
