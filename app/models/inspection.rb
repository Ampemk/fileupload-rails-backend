class Inspection < ApplicationRecord
    belongs_to :restaurant

    validates :inspection_type, :risk_category, :description, :violation_type, presence: true
    validates :inspection_date, :violation_date, presence: true, date: true
end
