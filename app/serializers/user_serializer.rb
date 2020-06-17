class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :avatar, :id, :username, :created_at, :reviews, :user_shows
  has_many :user_shows, include_nested_attributes: :true
  has_many :reviews

  def avatar
    # production
    object.avatar.service_url if object.avatar.attached?

    # development
    # url_for(object.avatar) if object.avatar
  end

end
