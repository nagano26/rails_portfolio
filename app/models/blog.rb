class Blog < ApplicationRecord
    belongs_to :user
    attachment :blog_image

    validates :body_blog, presence: true
end
