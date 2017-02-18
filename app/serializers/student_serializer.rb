class StudentSerializer < ActiveModel::Serializer
  belongs_to :branch
  attributes :id, :name, :email, :student_class, :studying_status
end
