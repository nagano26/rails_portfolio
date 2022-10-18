class Normal < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :good_normals, dependent: :destroy
    has_many :notifications, dependent: :destroy

    with_options presence: true do
        validates :before_address
        validates :current_address
        validates :trigger
        validates :preparation
    end

    def create_notification_like!(current_user)
        temp = Notification.where(["visitor_id = ? and visited_id = ? and normal_id = ? and action = ? ", current_user.id, user_id, id, 'good_normal'])
        if temp.blank?
            notification = current_user.active_notifications.new(
            normal_id: id,
            visited_id: user_id,
            action: 'good_normal'
            )
            if notification.visitor_id == notification.visited_id
                notification.checked = true
            end
            notification.save if notification.valid?
        end
    end

    def create_notification_comment!(current_user, comment_id)
        temp_ids = Comment.select(:user_id).where(normal_id: id).where.not(user_id: current_user.id).distinct
        temp_ids.each do |temp_id|
            save_notification_comment!(current_user, comment_id, temp_id['user_id'])
        end
        save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
    end

    def save_notification_comment!(current_user, comment_id, visited_id)
        notification = current_user.active_notifications.new(
        normal_id: id,
        comment_id: comment_id,
        visited_id: visited_id,
        action: 'comment'
        )
        if notification.visitor_id == notification.visited_id
            notification.checked = true
        end
        notification.save if notification.valid?
    end

    def self.last_week
        Normal.joins(:good_normals).where(good_normals: {created_at:0.days.ago.prev_week..0.days.ago.prev_week(:sunday)}).group(:id).order("count(*) desc")
    end
end
