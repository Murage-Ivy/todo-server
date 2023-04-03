class TodoUserSerializer < ActiveModel::Serializer
  attributes :id, :email, :image
  has_many :todos
end
