desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "sending reminders..."
  # User.all.each do |user|
  #   if user.email_reminders == 1
  #     user.send_email
  #   end
  #   if user.text_reminders == 1
  #     user.send_text
  #   end
  #   # puts user.first_name
  # end
  # User.second.send_text
  User.fourth.send_email
  puts "reminders sent"
end

# task :send_reminders => :environment do
#   User.send_reminders
# end
