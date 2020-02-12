class Review < ApplicationRecord
    belongs_to :user
    belongs_to :show
    has_many :comments, dependent: :destroy
end
