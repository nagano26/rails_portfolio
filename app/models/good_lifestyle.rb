class GoodLifestyle < ApplicationRecord
    belongs_to :user
    belongs_to :lifestyle

    validates_uniqueness_of :lifestyle_id, scope: :user_id
end
