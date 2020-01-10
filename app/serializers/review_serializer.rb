class ReviewSerializer < ActiveModel::Serializer
  # attributes :id, :user_id, :show_id, :rating, :content
  belongs_to :user
  belongs_to :show

  def initialize(review_obj)
    @review = review_obj
  end

  def to_serialized_json
    @review.to_json(:include => {
      :user => {only: [:username]}})
  end
end
