FactoryGirl.define do
	factory :user do
		first	"The"
		last	"Batman"
		email	"batman@gmail.com"
		password	"password"
		password_confirmation "password"
		ident	"ab1234"
		house_id 1
		rank	"Captain"
	end
end
