class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :normal
    
    validates :content, presence: true
end
