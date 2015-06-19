require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3) }
    it { should validate_uniqueness_of(:name) }
  end
  describe "should be invalid if name isn't formatted correctly" do
    it { should_not allow_value("MGMT Pl@ns").for(:name) }
    it { should_not allow_value("").for(:name) }
    it { should_not allow_value("25").for(:name) }
  end
  describe "should be valid with proper name formatting" do
    it { should allow_value("Management plan").for(:name) }
  end
  it "should have a working factory" do
      Fabricate.build(:category).should be_valid
    end
end
