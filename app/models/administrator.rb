class Administrator < ApplicationRecord
	has_secure_password
	validates :username, uniqueness: true, length: { in: 1..10 }
	validates :password, presence: true, allow_nil: true
	validates :email, uniqueness: true
end
