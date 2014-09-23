class Dig < ActiveRecord::Base

	validates :spit_id, :presence => true
	validates :user_id, :presence => true

	belongs_to :spit
	belongs_to :user

	validates :spit_id, uniqueness: { :scope => :user_id }

end