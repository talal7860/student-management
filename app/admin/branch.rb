ActiveAdmin.register Branch do
  config.comments = false
  collection_action :autocomplete, method: :get do
    branch = Branch.where('LOWER(name) ILIKE ?', "#{params[:term]}%")
    render json: branch, each_serializer: AutocompleteSerializer, root: false
  end

  index do
    selectable_column
    column :name
    column :type_
    actions
  end
  show do
    attributes_table do
      row :name
      row :type_
    end
    active_admin_comments
  end

  permit_params :name, :type_
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Branch Details' do
      f.input :name
      f.input :type_
    end
    f.actions
  end
end
