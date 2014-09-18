class UserMailer < ActionMailer::Base
  default from: "spitter@spitter.com"

  def signup_confirmation(user)
    # @greeting = "Hi"
    @user = user
    mail to: user.email, subject: "Sign Up Confirmation"
  end
end
