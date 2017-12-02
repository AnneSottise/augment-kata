class Shift < ActiveRecord::Base
	belongs_to :worker

	validates :worker_id,
						:start_date,
						presence: true

	before_save :compute_price

	def compute_price
		ShiftPricer
			.new(self)
			.perform

		true
	end
end
