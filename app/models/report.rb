class Report < ApplicationRecord
	belongs_to :user
	belongs_to :issue
	has_many   :votes
end
