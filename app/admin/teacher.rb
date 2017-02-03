ActiveAdmin.register Teacher do
  config.comments = false
  collection_action :autocomplete, method: :get do
    teacher = Teacher.where('LOWER(name) ILIKE ?', "#{params[:term]}%")
    render json: teacher, each_serializer: AutocompleteSerializer, root: false
  end

  index do
    selectable_column
    column :name
    column :picture
    column :email
    column :cnic
    column :phone
    actions
  end

  show do
    attributes_table do
      row :name
      row :picture
      row :email
      row :cnic
      row :phone
    end
    active_admin_comments
  end

  permit_params :name, :email, :cnic, :phone, :picture

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Teacher Details' do
      f.input :name
      f.input :picture, as: :file
      f.input :email
      f.input :cnic
      f.input :phone
    end
    f.actions
  end
end
