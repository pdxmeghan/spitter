require 'rails_helper'

describe Dig do

	it { should validate_presence_of :spit_id }
	it { should validate_presence_of :user_id }

	it { should belong_to :spit }
	it { should belong_to :user }

	it { should validate_uniqueness_of(:spit_id).scoped_to(:user_id) }

end