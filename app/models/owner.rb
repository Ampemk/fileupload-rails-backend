class Owner < ApplicationRecord
    has_one :address, dependent: :destroy
    validates :name, presence: true
    accepts_nested_attributes_for :address
end
