class User < ApplicationRecord
    has_many :user_shows
    has_many :shows, through: :user_shows
    has_many :reviews
    validates :username, uniqueness: true

    has_secure_password

end
