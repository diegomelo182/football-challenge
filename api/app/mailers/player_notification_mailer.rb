class PlayerNotificationMailer < ApplicationMailer
  def send_notification
    @message, email, player = params.values_at :message, :email, :player
    @player = JSON.parse(player)

    mail(to: email, subject: 'There is a notification regarding a player you subscribed')
  end
end
