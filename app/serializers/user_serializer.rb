class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  # attributes :avatar_url
  attributes :avatar, :id, :username, :created_at, :reviews, :user_shows
  has_many :user_shows, include_nested_attributes: :true
  has_many :reviews
  # has_many :shows, through: :user_shows
  # has_many :shows, through: :reviews
  # has_one_attached :avatar



  def avatar
    # if object.avatar.attached?
    url_for(object.avatar) if object.avatar.attached?
    # else
    #   return null
    # end
  end

  # def to_serialized_json
  #   object.to_json(include: [ 
  #     :avatar_url,
  #     user_shows: {only: [:seen, :created_at], include: [:show]}
  #     ], 
  #     except: [
  #       :password_digest, :updated_at
  #       ])
  # end

end
