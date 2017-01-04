ActiveAdmin.register Branch do
permit_params :name, :branch_type
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Branch Details" do
      f.input :name
      f.input :branch_type
    end
    f.actions
  end

end
