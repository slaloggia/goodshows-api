class UserSerializer < ActiveModel::Serializer
  has_many :user_shows
  has_many :reviews
  has_many :shows, through: :user_shows
  has_many :shows, through: :reviews

  def initialize(user_obj) 
    @user = user_obj
  end

  def to_serialized_json
    @user.to_json(include: [
      reviews: {include: [show: {only: [:title, :image]}]}, 
      user_shows: {only: [:seen, :created_at], include: [:show]}
      ], 
      except: [
        :password_digest, :updated_at
        ])
  end

end
