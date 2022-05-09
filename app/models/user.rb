class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :normals, dependent: :destroy
  has_many :works, dependent: :destroy
  has_many :lifestyles, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :comment_works, dependent: :destroy
  has_many :comment_lifestyles, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :good_normals, dependent: :destroy
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  def already_favorited?(room)
    self.favorites.exists?(room_id: room.id)
  end
  
  def already_good?(normal)
    self.good_normals.exists?(normal_id: normal.id)
  end
  
  with_options presence: true do
    validates :username
    validates :email
  end
end
