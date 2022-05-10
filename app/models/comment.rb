class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :normal
    has_many :notifications, dependent: :destroy
    
    validates :content, presence: true
end
