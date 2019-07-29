class Notification < ApplicationRecord
  belongs_to :order, optional: true, dependent: :destroy

  scope :unread,->{where read: false}

  after_create_commit {
    NotificationBroadcastJob.perform_now(Notification.unread.size, self)}

  validates :event, presence: true

end
