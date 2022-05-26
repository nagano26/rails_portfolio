class CommentLifestyle < ApplicationRecord
    belongs_to :user
    belongs_to :lifestyle
    has_many :notifications, dependent: :destroy
    
    validates :content, presence: true
end
