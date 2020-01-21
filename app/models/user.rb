class User < ApplicationRecord
    validates :username, uniqueness: true
    has_many :user_shows
    has_many :shows, through: :user_shows
    has_many :reviews
    has_many :comments
    has_many :notifications, foreign_key: :recipient_id
    has_one_attached :avatar

    has_secure_password

    
end
