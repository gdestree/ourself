class UserMailer < ApplicationMailer
  default from: 'ourself.heroku@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://ourself.herokuapp.com/sessions/login'
    mail(to: @user.email, subject: 'Welcome to Ourself')
  end
end
