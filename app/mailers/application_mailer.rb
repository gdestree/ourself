class ApplicationMailer < ActionMailer::Base
  default from: "ourself.heroku@gmail.com"
  layout 'mailer'

end
