class Blog < ApplicationRecord
    belongs_to :user
    attachment :blog_image
end
