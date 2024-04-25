require 'rails_helper'

RSpec.describe Inspection, type: :model do
  it { should belong_to(:restaurant) } # Mandatory association with restaurant
  it { should validate_presence_of(:inspection_date) } # Ensures inspection date is present

end
