require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:address) { create(:account) }

  describe 'model address' do
    it { should belong_to(:restaurant).optional } # Optional association with restaurant
    it { should belong_to(:owner).optional } # Optional association with owner
  
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:zip_code) }
  end

end