FactoryGirl.define do
	factory :user do
		sequence(:first)	{ |n| "First #{n}" }
		sequence(:last)		{ |n| "Last #{n}" }
		sequence(:email)	{ |n| "person_#{n}@example.com"}
		password	"password"
		password_confirmation "password"
		ident	"ab1234"
		house_id 1
		rank	"Captain"
		house	{FactoryGirl.create(:house)}
		
		factory :admin do
			admin true
		end
	end
	
	factory :trade do
		date DateTime.now
		flipflop true
		worktrade false
		user
	end
	
	factory :house do
		sequence(:name)		{ |n| "Station #{n}"}
		sequence(:number)	{ |n| n}
		address				"123 Fake St"
		address2			"none"
		phone				Faker::PhoneNumber.phone_number
		department_id		1
		battalion			10
		department			{FactoryGirl.create(:department) }
	end
		
	factory :department do
		name		"San Francisco Fire Department"
		city		"San Francisco"
		state		"CA"
	end	
		
end
