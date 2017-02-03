ActiveAdmin.register Course do
  config.comments = false
  collection_action :autocomplete, method: :get do
    course = Course.where('LOWER(name) ILIKE ?', "#{params[:term]}%")
    render json: course, each_serializer: AutocompleteSerializer, root: false
  end

  ActiveAdmin.setup do |config|
    config.site_title = 'My Default Site Title'
    config.namespace :admin do |admin|
      admin.site_title = 'Admin Site'
    end

    config.namespace :parents do |parent|
      parent.site_title = 'Parent view'
    end
  end

  index do
    selectable_column
    column :name
    column :year
    actions
  end
  show do
    attributes_table do
      row :name
      row :year
    end
    active_admin_comments
  end

  permit_params :name, :year
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Course Details' do
      f.input :name
      f.input :year
    end
    f.actions
  end
end
