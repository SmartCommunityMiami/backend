class Vote < ApplicationRecord
	belongs_to :report
	belongs_to :user
end
