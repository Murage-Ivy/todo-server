class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :image
  has_many :todos
end
