class Normal < ApplicationRecord
    belongs_to :user

    with_options presence: true do
        validates :before_address
        validates :current_address
        validates :trigger
        validates :preparation
    end
end
