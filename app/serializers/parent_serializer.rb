class ParentSerializer < ActiveModel::Serializer
  has_many :students
  attributes :email
end
