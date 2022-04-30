class Work < ApplicationRecord
    belongs_to :user
    
    with_options presence: true do
        validates :before_work
        validates :current_work
        validates :others_work
        validates :message_work
    end
end
