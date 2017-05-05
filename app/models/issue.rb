class Issue < ApplicationRecord
	belongs_to :department
	has_many :reports
end
