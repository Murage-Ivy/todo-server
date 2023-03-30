class TodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_date, :end_date, :status
end
