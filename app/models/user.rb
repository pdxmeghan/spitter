class User < ActiveRecord::Base

  validates :email, :presence => true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, on: :create }
  validates :user_name, :presence => true
  validates :password, :presence => true
  validates :password_confirmation, :presence => true

  validates_uniqueness_of :email
  validates_uniqueness_of :user_name
  validates_length_of :user_name, :maximum => 15

  has_secure_password
  before_save { |user| user.user_name = user.user_name.downcase }
  after_save :send_welcome_message

  def send_welcome_message
    UserMailer.signup_confirmation(self).deliver
  end
end
