require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:client_id)}
    it {should validate_presence_of(:name)}
    it {should validate_numericality_of(:client_id)}
  end

  describe 'associations' do
    it {should belong_to(:client) }
  end

  describe 'factories' do
    it 'should have a working factory' do
      Fabricate.build(:project).should be_valid
    end
  end

end
