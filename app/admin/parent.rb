ActiveAdmin.register Parent do
collection_action :autocomplete, method: :get do
    parent = Parent.where('LOWER(name) ILIKE ?', "#{params[:term]}%")
    render json: parent, each_serializer: AutocompleteSerializer, root: false
  end
  
  permit_params :name, :email, :cnic, :phone

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Parent Details" do
      f.input :name
      f.input :email
      f.input :cnic
      f.input :phone
    end
    f.actions
  end

end
