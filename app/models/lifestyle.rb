class Lifestyle < ApplicationRecord
    belongs_to :user
    
    with_options presence: true do
        validates :price_life
        validates :house_life
        validates :dating_life
        validates :system_life
    end
end
