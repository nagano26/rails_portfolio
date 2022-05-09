class GoodNormal < ApplicationRecord
    belongs_to :user
    belongs_to :normal

    validates_uniqueness_of :normal_id, scope: :user_id
end
