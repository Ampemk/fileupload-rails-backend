class Restaurant < ApplicationRecord
    before_save :set_timestamps

    has_many :inspection, dependent: :destroy
    has_one :address, dependent: :destroy
    belongs_to :owner, optional: true

    validates :name, presence: true

    accepts_nested_attributes_for :address

    private 
    
    def set_timestamps
        self.created_at = Time.now()
        self.updated_at = Time.now()
    end
end
