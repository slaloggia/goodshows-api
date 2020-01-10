class UserSerializer < ActiveModel::Serializer
  has_many :user_shows
  has_many :reviews
  has_many :shows, through: :user_shows

  def initialize(user_obj) 
    @user = user_obj
  end

  def to_serialized_json
    @user.to_json(include: [:reviews, :shows], except: [:password_digest, :updated_at])
  end

end
