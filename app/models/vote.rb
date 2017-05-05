class Vote < ApplicationRecord
	belongs_to :report
	belongs_to :user

	validates_uniqueness_of :user_id, scope: :report_id
	validates_uniqueness_of :report_id, scope: :user_id

	validates :direction, acceptance: { accept: [1, -1] } 

end
