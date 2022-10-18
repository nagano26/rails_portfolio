class Lifestyle < ApplicationRecord
    belongs_to :user
    has_many :comment_lifestyles, dependent: :destroy
    has_many :good_lifestyles, dependent: :destroy
    has_many :notifications, dependent: :destroy
    
    with_options presence: true do
        validates :price_life
        validates :house_life
        validates :dating_life
        validates :system_life
    end

    def create_notification_like_lifestyle!(current_user)
        temp = Notification.where(["visitor_id = ? and visited_id = ? and lifestyle_id = ? and action = ? ", current_user.id, user_id, id, 'good_lifestyle'])
        if temp.blank?
            notification = current_user.active_notifications.new(
            lifestyle_id: id,
            visited_id: user_id,
            action: 'good_lifestyle'
            )
            if notification.visitor_id == notification.visited_id
                notification.checked = true
            end
            notification.save if notification.valid?
        end
    end

    def create_notification_comment_lifestyle!(current_user, comment_lifestyle_id)
        temp_ids = CommentLifestyle.select(:user_id).where(lifestyle_id: id).where.not(user_id: current_user.id).distinct
        temp_ids.each do |temp_id|
            save_notification_comment_lifestyle!(current_user, comment_lifestyle_id, temp_id['user_id'])
        end
        save_notification_comment_lifestyle!(current_user, comment_lifestyle_id, user_id) if temp_ids.blank?
    end
    
    def save_notification_comment_lifestyle!(current_user, comment_lifestyle_id, visited_id)
        notification = current_user.active_notifications.new(
        lifestyle_id: id,
        comment_lifestyle_id: comment_lifestyle_id,
        visited_id: visited_id,
        action: 'comment_lifestyle'
        )
        if notification.visitor_id == notification.visited_id
            notification.checked = true
        end
        notification.save if notification.valid?
    end
end
