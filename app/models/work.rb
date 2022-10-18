class Work < ApplicationRecord
    belongs_to :user
    has_many :comment_works, dependent: :destroy
    has_many :good_works, dependent: :destroy
    has_many :notifications, dependent: :destroy
    
    with_options presence: true do
        validates :before_work
        validates :current_work
        validates :others_work
        validates :message_work
    end

    def create_notification_like_work!(current_user)
        temp_work = Notification.where(["visitor_id = ? and visited_id = ? and work_id = ? and action = ? ", current_user.id, user_id, id, 'good_work'])
        if temp_work.blank?
            notification = current_user.active_notifications.new(
            work_id: id,
            visited_id: user_id,
            action: 'good_work'
            )
            if notification.visitor_id == notification.visited_id
                notification.checked = true
            end
            notification.save if notification.valid?
        end
    end

    def create_notification_comment_work!(current_user, comment_work_id)
        temp_ids = CommentWork.select(:user_id).where(work_id: id).where.not(user_id: current_user.id).distinct
        temp_ids.each do |temp_id|
            save_notification_comment_work!(current_user, comment_work_id, temp_id['user_id'])
        end
        save_notification_comment_work!(current_user, comment_work_id, user_id) if temp_ids.blank?
    end
    
    def save_notification_comment_work!(current_user, comment_work_id, visited_id)
        notification = current_user.active_notifications.new(
        work_id: id,
        comment_work_id: comment_work_id,
        visited_id: visited_id,
        action: 'comment_work'
        )
        if notification.visitor_id == notification.visited_id
            notification.checked = true
        end
        notification.save if notification.valid?
    end
end
