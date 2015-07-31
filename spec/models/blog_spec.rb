require 'rails_helper'

RSpec.describe Blog, type: :model do
  it { should belong_to(:user) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
end
