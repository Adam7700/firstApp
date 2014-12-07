class Ride < ActiveRecord::Base
  	belongs_to :user
  	belongs_to :service

  	has_many :user_rides
 	has_many :users, through: :user_rides

	validates :user, presence: true
	validates :service, presence: true
	
	validates :number_of_seats, numericality: { only_integer: true, greater_than: -1 }, presence: true , allow_blank: false, allow_nil: false
	validates :seats_available, numericality: { only_integer: true, greater_than: -1}, presence: true , allow_blank: false, allow_nil: false
	
	validate :proper_return_time
	validate :more_than_num_seats
	validate :time_travel
	validate :not_created_today

	
	validates :vehicle, presence: true
	validates :date, presence: true
	validates :meeting_location, presence: true
	validates :leave_time, presence: true
	validates :return_time, presence: true


	
	private
	
	def more_than_num_seats
		if (seats_available.blank? || number_of_seats.blank?) || seats_available > number_of_seats
			errors.add(:seats_available, "seats avail should be less than num seats") 
		end
 	end
	
	def proper_return_time
		if (return_time.blank? || leave_time.blank?) || return_time <= leave_time
			errors.add(:seats_available, "seats avail should be less than num seats") 
		end
	end
	
	def time_travel
		if ((date.blank?) || date < Date.today) && has_not_been_created
			errors.add(:return_time, "time machines have not been invented yet") 
		end
	end
	
	def not_created_today
		if (date.blank? || date == Date.today) && has_not_been_created
			errors.add(:date, "cant be created today")
		end
	end
	
	def has_not_been_created
		created_at.blank? 
	end
end




