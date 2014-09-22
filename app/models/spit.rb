class Spit < ActiveRecord::Base

  validates :user_id, :presence => true
  validates :text, :presence => true

  validates_length_of :text, :maximum => 140

  belongs_to :user

  def date_string
    self.created_at.strftime("%m-%d-%Y %I:%M")
  end
end
