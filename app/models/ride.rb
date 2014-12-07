class Ride < ActiveRecord::Base
  	belongs_to :user
  	belongs_to :service

  	has_many :user_rides
 	has_many :users, through: :user_rides

	validates :user, presence: true
	validates :service, presence: true
	
	validates :number_of_seats, numericality: { only_integer: true, greater_than: -1 }, presence: true , allow_blank: false, allow_nil: false
	validates :seats_available, numericality: { only_integer: true, greater_than: -1}, presence: true , allow_blank: false, allow_nil: false
	
	
	
	validates :vehicle, presence: true
	validates :date, presence: true
	validates :meeting_location, presence: true
	validates :leave_time, presence: true
	validates :return_time, presence: true

	private
	
	def more_than_num_seats
		  
		errors.add(:price, "seast avail should be less than num seats") unless :seats_available < :number_of_seats

 	end

end


