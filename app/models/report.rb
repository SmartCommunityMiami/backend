class Report < ApplicationRecord
	belongs_to :user
	belongs_to :issue
	has_many   :votes

	validates :issue, presence: true 
	validates :user, presence: true 
	validates :description, presence: true 
	validates :latitude, presence: true 
	validates :longitude, presence: true 
end
