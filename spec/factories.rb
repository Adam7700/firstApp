FactoryGirl.define do
    factory :user do

		sequence(:name) { |i| "User #{i}" }
		sequence(:email) { |i| "user.#{i}@example.com" }
		password 'password'

		password_confirmation "password"
	
		factory :admin do
			admin true
		end

    end

    factory :church do

		name "theChurch"
		user

		transient { num_services 1 }

		after(:create) do |church, evaluator|
	   		create_list(:service, evaluator.num_services, church: church)
		end
	
    end

    factory :service do
		church
		location "overThere"
		finish_time "11:00"
		start_time "9:00"
		day_of_week "Sunday"
		
#	church
	transient { num_rides 1 }

	after(:create) do |service, evaluator|
	    create_list(:ride, evaluator.num_rides, service: service)
	end

    end

    factory :ride do
		user
		service
		number_of_seats 4
		seats_available 2
		return_time "9:00"
		vehicle "scion"
		date Date.today+1.day
		meeting_location "overThere"
		leave_time "8:00"
    end

    factory :user_ride do
		user
		ride
    end
end
