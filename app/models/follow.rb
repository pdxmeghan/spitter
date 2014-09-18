class Follow < ActiveRecord::Base

  validates :user_id, :presence => true
  validates :follower_id, :presence => true


  belongs_to :user, :dependent => :destroy
  belongs_to :followed_users, class_name: 'User'

end
