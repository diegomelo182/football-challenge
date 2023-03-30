# frozen_string_literal: true

class NotificationEmailJob
  include Sidekiq::Job

  def perform(player_id, message)
    subscriptions = Subscription.where(player_id:).eager_load(:user, :player)

    subscriptions.each do |subscription|
      PlayerNotificationMailer.with(message:, email: subscription.user.email,
                                    player: subscription.player.to_json).send_notification.deliver_later
    end
  end
end
