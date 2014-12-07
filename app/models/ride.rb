class Ride < ActiveRecord::Base
  	belongs_to :user
  	belongs_to :service

  	has_many :user_rides
 	has_many :users, through: :user_rides

	validates :user, presence: true
	validates :service, presence: true
	validates :number_of_seats, presence: true
	validates :return_time, presence: true
	validates :vehicle, presence: true
	validates :date, presence: true
	validates :meeting_location, presence: true
	validates :seats_available, presence: true
	validates :leave_time, presence: true

end
