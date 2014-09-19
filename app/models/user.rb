class User < ActiveRecord::Base

  validates :email, :presence => true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, on: :create }
  validates :user_name, :presence => true
  validates :password, :presence => true
  validates :password_confirmation, :presence => true

  validates_uniqueness_of :email
  validates_uniqueness_of :user_name
  validates_length_of :user_name, :maximum => 15

  has_secure_password
  after_save :send_welcome_message

  has_many :followers, :class_name => 'Follow', :foreign_key => 'user_id'
  has_many :following, :class_name => 'Follow', :foreign_key => 'follower_id'
  has_many :spits, :dependent => :destroy
  after_save :follow_thyself

  def send_welcome_message
    UserMailer.signup_confirmation(self).deliver
  end

  def following_spits
    @following_spits = []
    self.following.each do |f|
      @following_spits << Spit.where(:user_id => f.user_id)
    end
    return @following_spits
  end

  def follow_thyself
    Follow.create(:user_id => self.id, :follower_id => self.id)
  end
end
