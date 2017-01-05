ActiveAdmin.register User do
  collection_action :autocomplete, method: :get do
    users = User.where('LOWER(name) ILIKE ?', "#{params[:term]}%")
    render json: users, each_serializer: AutocompleteSerializer, root: false
  end
  
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
