class Department < ApplicationRecord
	has_many :issues

	validates :name, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :phone, presence: true, uniqueness: true


end
