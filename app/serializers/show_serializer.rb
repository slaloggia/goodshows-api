class ShowSerializer < ActiveModel::Serializer
  attributes :id, :title, :image, :category
  has_many :reviews

  def initialize(show_obj)
    @show = show_obj
  end

  def to_serialized_json
    @show.to_json(:include => {
      :reviews => {:include => {
        :user => {:only => [:username]}
      }}
    })
  end
end
