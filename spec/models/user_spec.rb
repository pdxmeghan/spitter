require 'rails_helper'

describe User do
  it { should validate_presence_of :email }
  it { should validate_presence_of :user_name }
  it { should validate_presence_of :password }
  it { should validate_presence_of :password_confirmation }
  it { should ensure_length_of(:user_name).is_at_most(15) }

  it 'should validate uniqueness of email' do
    user1 = User.create(:user_name => 'Josie', :email => 'josie@gmail.com', :password => '123', :password_confirmation => '123')
    user2 = User.new(:user_name => 'Meghan', :email => 'josie@gmail.com', :password => '123', :password_confirmation => '123')
    expect(user2.save).to eq false
  end

  it 'should validate uniqueness of username' do
    user1 = User.create(:user_name => 'Meghan', :email => 'meghan@gmail.com', :password => '123', :password_confirmation => '123')
    user2 = User.new(:user_name => 'Meghan', :email => 'josie@gmail.com', :password => '123', :password_confirmation => '123')
    expect(user2.save).to eq false
  end

  it { should have_many :followers }
  it { should have_many :following }
  it { should have_many :spits }

end
