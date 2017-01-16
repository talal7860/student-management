ActiveAdmin.register Branch do
  collection_action :autocomplete, method: :get do
    branch = Branch.where('LOWER(name) ILIKE ?', "#{params[:term]}%")
    render json: branch, each_serializer: AutocompleteSerializer, root: false
  end
  permit_params :name, :type_
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Branch Details" do
      f.input :name
      f.input :type_
    end
    f.actions
  end

end
