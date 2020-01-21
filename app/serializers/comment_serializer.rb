class CommentSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :review_id, :content, :user
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
