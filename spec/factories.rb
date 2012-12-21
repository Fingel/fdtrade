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
		
		factory :admin do
			admin true
		end
	end
end
