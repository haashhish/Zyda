class ListSerializer < ActiveModel::Serializer
  attributes :task, :status, :user_id
  belongs_to :user
end
