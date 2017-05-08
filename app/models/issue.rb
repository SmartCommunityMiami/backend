class Issue < ApplicationRecord
	belongs_to :department
	has_many :reports

	validates :department, presence: true
	validates :description, presence: true
end
