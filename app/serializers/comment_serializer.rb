class CommentSerializer < ActiveModel::Serializer
  attributes :id, :review_id, :content
  belongs_to :review
  belongs_to :user

  def user
    {
      username: object.user.username,
      avatar: avatar
    }
  end

  def avatar
    url_for(object.user.avatar) if object.user.avatar.attached?
  end
end
