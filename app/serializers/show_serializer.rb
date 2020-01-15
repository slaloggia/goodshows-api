class ShowSerializer < ActiveModel::Serializer
  attributes :id, :title, :image, :category, :creatives
  has_many :reviews

  # def initialize(show_obj)
  #   @show = show_obj
  # end

  # def to_serialized_json
  #   @show.to_json(include: [reviews: {only: [:id]}])
    
  # end
end
