require 'rails_helper'

RSpec.describe TimeEntry, type: :model do
  describe "validations" do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:client_id) }
    it { should validate_numericality_of(:client_id) }
    it { should validate_presence_of(:category_id) }
    it { should validate_numericality_of(:category_id) }
    it { should validate_presence_of(:comment) }
    it { should validate_presence_of(:area) }
    it { should validate_presence_of(:business_mileage) }
    it { should validate_numericality_of(:business_mileage) }
    it { should validate_presence_of(:personal_mileage) }
    it { should validate_numericality_of(:personal_mileage) }
    it { should validate_presence_of(:hours_worked) }
    it { should validate_numericality_of(:hours_worked) }
  end
  describe "belongs to" do
    it { should belong_to(:user) }
  end
  it "should have a working factory" do
    Fabricate.build(:time_entry).should be_valid
  end
end
