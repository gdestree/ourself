class User < ActiveRecord::Base
  require_relative '../helpers/cstrength_helper.rb'
  include CstrengthHelper

  has_many :tones
  has_many :reactions
  has_many :cstrengths, through: :reactions, source: :cstrength
  has_many :answers, through: :reactions, source: :answers

  has_secure_password

  validates :first_name,:email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create

  # def send_email
  #   email = self.email
  #   message = "Mailgun email"
  #   # message = "Hello #{self.first_name}, please take some time today to reflect on the subject of #{todays_cstrength.name}"

  #   `curl -s --user 'api:key-83a6b3d89bd1e4040ec65e17cd9e86d0' \
  #   https://api.mailgun.net/v3/appa67cb36fa7114983991810cb10e9909b.mailgun.org/messages \
  #   -F from='Mailgun Sandbox <postmaster@appa67cb36fa7114983991810cb10e9909b.mailgun.org>' \
  #   -F to="#{self.first_name} <#{email}>" \
  #   -F subject="Daily Intention: #{todays_cstrength.name}" \
  #   -F text="#{message}"`
  # end

  def reminder_text
    message = "Hello #{self.first_name}, please take some time today to reflect on the subject of #{todays_cstrength.name}"

    `curl -X POST 'https://api.twilio.com/2010-04-01/Accounts/ACd52060fb87ec8b2044ddf6095f3be2ba/Messages.json' \
      --data-urlencode "To=#{self.phone_number}" \
      --data-urlencode "From=8086701501" \
      --data-urlencode "Body=#{message}" \
      -u ACd52060fb87ec8b2044ddf6095f3be2ba:0d2905c1c2093ff16322c049adfab9ee`
  end

  def welcome_text
    message = "Hello #{self.first_name}, please take some time today to reflect on the subject of #{todays_cstrength.name}"

    `curl -X POST 'https://api.twilio.com/2010-04-01/Accounts/ACd52060fb87ec8b2044ddf6095f3be2ba/Messages.json' \
      --data-urlencode "To=#{self.phone_number}" \
      --data-urlencode "From=8086701501" \
      --data-urlencode "Body=#{message}" \
      -u ACd52060fb87ec8b2044ddf6095f3be2ba:0d2905c1c2093ff16322c049adfab9ee`
  end
end
