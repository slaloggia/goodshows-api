class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :recipient_id, :actor_id, :read, :action, :notifiable_id, :notifiable_type
  # belongs_to :recipient, class_name: "User"
  belongs_to :actor, class_name: "User"
  # belongs_to :notifiable, polymorphic: true

  def actor
    {
      username: object.actor.username
    }
  end
end
