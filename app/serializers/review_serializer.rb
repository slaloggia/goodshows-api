class ReviewSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :user_id, :show_id, :rating, :created_at, :content, :show
  belongs_to :user
  belongs_to :show

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
