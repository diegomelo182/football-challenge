namespace :notifications do
  desc 'Task responsible for manage notifications records in the database'
  task remove_old_records: :environment do
    puts 'Removing old notifications...'

    Notification.where('created_at < ?', Date.today - 1.week).delete_all

    puts 'The old notifications were removed successfully'
  end
end
