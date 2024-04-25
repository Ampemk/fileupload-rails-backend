require 'rails_helper'

RSpec.describe Restaurant, type: :model do 
    it { should validate_presence_of(:name) }
    it { should have_one(:address).dependent(:destroy) }
    it { should accept_nested_attributes_for(:address) }
    it { should have_many(:inspection).dependent(:destroy) }

    describe " create with address" do 
        let(:restaurant_params) do 
            { name: "The Happy Taco", phone: 5551234567,
                address_attributes: { street: "123 Main St", city: "Anytown", state: "CA", zip_code: "12345" } }
        end
        let(:restau) { Restaurant.create(restaurant_params) }

        it " inserts a restarant with a new address" do
            expect { Restaurant.create(restaurant_params)}.to change(Restaurant, :count).by(1)
            expect(Address.count).to eq(1)
        end
    end

end