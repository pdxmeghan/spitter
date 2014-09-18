require 'rails_helper'

describe Spit do

  it { should validate_presence_of :user_id }
  it { should validate_presence_of :text }

  it { should ensure_length_of(:text).is_at_most(140) }

  it { should belong_to :user }

end
