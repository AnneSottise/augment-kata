class Worker < ActiveRecord::Base
	extend Enumerize

	has_many :shifts

  enumerize :status, in: [:intern, :medic, :temporary]

  validates :first_name,
  					:status,
  					presence: true
end
