require 'rails_helper'

RSpec.describe Admin, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it { should validate_length_of(:name).is_at_least(4).is_at_most(10) }
  it { should validate_length_of(:email).is_at_least(10).is_at_most(20) }
  it { should validate_length_of(:password).is_at_least(6).is_at_most(15) }
end
