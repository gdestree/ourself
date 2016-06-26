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

  def send_email
    email = self.email
    text = "Hello #{self.first_name}, please take some time today to reflect on the subject of #{todays_cstrength.name}"

    `curl -s --user 'api:key-9cc61d00a297df556631398ca29a11af' \
    https://api.mailgun.net/v3/sandbox758b7807d67844029454457680227e69.mailgun.org/messages \
    -F from='Mailgun Sandbox <postmaster@sandbox758b7807d67844029454457680227e69.mailgun.org>' \
    -F to="#{self.first_name} <#{email}>" \
    -F subject="Daily Intention: #{todays_cstrength.name}" \
    -F text="#{text}"`
  end

  def send_text(message)
    `curl -X POST 'https://api.twilio.com/2010-04-01/Accounts/ACd52060fb87ec8b2044ddf6095f3be2ba/Messages.json' \
      --data-urlencode "To=#{self.phone_number}" \
      --data-urlencode "From=8086701501" \
      --data-urlencode "Body=#{message}" \
      -u ACd52060fb87ec8b2044ddf6095f3be2ba:0d2905c1c2093ff16322c049adfab9ee`
  end
end
