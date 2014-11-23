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
    end

    factory :service do
		church
		location "overThere"
		finish_time "11:00"
		start_time "9:00"
		day_of_week "Sunday"
		
    end

    factory :ride do
		user
		service
    end

    factory :user_ride do
		user
		ride
    end
end
