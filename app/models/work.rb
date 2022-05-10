class Work < ApplicationRecord
    belongs_to :user
    has_many :comment_works, dependent: :destroy
    has_many :good_works, dependent: :destroy
    
    with_options presence: true do
        validates :before_work
        validates :current_work
        validates :others_work
        validates :message_work
    end

end
