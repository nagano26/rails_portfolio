class CommentLifestyle < ApplicationRecord
    belongs_to :user
    belongs_to :lifestyle

    validates :content, presence: true
end
