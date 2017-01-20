ActiveAdmin.register Parent do
  collection_action :autocomplete, method: :get do
    parent = Parent.where('LOWER(name) ILIKE ?', "#{params[:term]}%")
    render json: parent, each_serializer: AutocompleteSerializer, root: false
  end

  controller do
    # before_action :authenticate_parent!
  end

  index do
    selectable_column
    column :name
    column :email
    column :cnic
    column :phone
    actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :cnic
      row :phone
    end
    active_admin_comments
  end

  permit_params :name, :email, :cnic, :phone

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Parent Details' do
      f.input :name
      f.input :email
      f.input :cnic
      f.input :phone
    end
    f.actions
  end
end
