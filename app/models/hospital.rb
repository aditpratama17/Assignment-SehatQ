class Hospital < ApplicationRecord
	validates :hospital_name, presence: true
	validates :address, presence: true
end
