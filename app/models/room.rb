class Room < ApplicationRecord
    belongs_to :user
    has_many :reservations, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :notifications, dependent: :destroy
    attachment :room_image

    def self.search(keyword)
        where(["room_name like? OR room_body like?", "%#{keyword}%", "%#{keyword}%"])
    end

    def self.search(area)
        where(['address LIKE ?', "%#{area}%"]) 
    end 

    with_options presence: true do
        validates :room_name
        validates :room_body
        validates :room_price
        validates :address
    end
    validates :room_price, {numericality: true}

    def create_notification_like_room!(current_user)
        temp = Notification.where(["visitor_id = ? and visited_id = ? and room_id = ? and action = ? ", current_user.id, user_id, id, 'favorite'])
        if temp.blank?
            notification = current_user.active_notifications.new(
            room_id: id,
            visited_id: user_id,
            action: 'favorite'
            )
            if notification.visitor_id == notification.visited_id
                notification.checked = true
            end
            notification.save if notification.valid?
        end
    end
end
