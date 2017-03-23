class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user
    @greeting = "Welcome to Ke Yi Me"



    mail(to: @user.email, subject: 'Welcome to Ke Yi Me')
    # This will render a view in `app/views/user_mailer`!
  end
end
