class UserShow < ApplicationRecord
    # attributes :seen, :show_id
    belongs_to :user
    belongs_to :show
end
