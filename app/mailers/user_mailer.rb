class UserMailer < ApplicationMailer
  require_relative '../helpers/cstrength_helper.rb'
  include CstrengthHelper
  default from: 'ourself.heroku@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://ourself.herokuapp.com/sessions/login'
    mail(to: @user.email, subject: 'Welcome to Ourself')
  end

  def reminder_email(user)
    @cstrength = todays_cstrength.name
    @user = user
    @url  = 'http://ourself.herokuapp.com/sessions/login'
    mail(to: @user.email, subject: "Today\'s Intention: #{@cstrength}")
  end
end
