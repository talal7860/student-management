ActiveAdmin.register Teacher do
collection_action :autocomplete, method: :get do
    teacher = Teacher.where('LOWER(name) ILIKE ?', "#{params[:term]}%")
    render json: teacher, each_serializer: AutocompleteSerializer, root: false
  end
  
  permit_params :name, :email, :cnic, :phone, :picture

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Teacher Details" do
      f.input :name
      f.input :picture, as: :file
      f.input :email
      f.input :cnic
      f.input :phone
    end
    f.actions
  end


end
