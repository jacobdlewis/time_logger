require 'rails_helper'

RSpec.describe Client, type: :model do
  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_length_of(:last_name).is_at_least(2) }
    it { should validate_length_of(:first_name).is_at_least(2) }
  end
  describe "should be invalid if name isn't formatted correctly" do
    it { should_not allow_value("@@@@@").for(:first_name) }
    it { should_not allow_value("").for(:first_name) }
    it { should_not allow_value("25").for(:first_name) }
    it { should_not allow_value("A").for(:first_name) }
  end
  describe "should be valid with proper name formatting" do
    it { should allow_value("Suzanne").for(:first_name) }
    it { should allow_value("Kinsey").for(:last_name) }
  end
  it "should have a working factory" do
      Fabricate.build(:client).should be_valid
    end
end
