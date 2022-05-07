class Lifestyle < ApplicationRecord
    belongs_to :user
    has_many :comment_lifestyles, dependent: :destroy
    
    with_options presence: true do
        validates :price_life
        validates :house_life
        validates :dating_life
        validates :system_life
    end

end
