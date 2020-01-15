class UserShowSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :show_id, :seen, :show, :created_at
end
