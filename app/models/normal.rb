class Normal < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :good_normals, dependent: :destroy

    with_options presence: true do
        validates :before_address
        validates :current_address
        validates :trigger
        validates :preparation
    end
end
