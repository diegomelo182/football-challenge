class Notification < ApplicationRecord
  belongs_to :player

  after_create :send_notification

  def send_notification
    NotificationEmailJob.perform_async(player_id, message)
  end
end
