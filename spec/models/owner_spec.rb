require 'rails_helper'

RSpec.describe Owner, type: :model do
  it { should validate_presence_of(:name) } # Ensures name is present
  it { should have_one(:address).dependent(:destroy) } # One owner has one address (optional)
end
