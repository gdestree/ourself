config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'ourself.herokuapp.com',
  user_name:            'ourself.heroku@gmail.com',
  password:             'ourself000',
  authentication:       'plain',
  enable_starttls_auto: true  }
