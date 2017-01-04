ActiveAdmin.register User do
permit_params :name, :role, :email, :cnic, :phone

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "User Details" do
      f.input :name
      f.input :role
      f.input :email
      f.input :cnic
      f.input :phone
    end
    f.actions
  end

end
