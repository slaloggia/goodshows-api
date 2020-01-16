class ShowSerializer < ActiveModel::Serializer
  attributes :id, :title, :image, :category, :creatives
  has_many :reviews

end
