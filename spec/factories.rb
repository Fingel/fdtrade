FactoryGirl.define do
	factory :user do
		first	"The"
		last	"Batman"
		email	"batman@gmail.com"
		password	"password"
		password_confirmation "password"
		ident	"ab1234"
		rank	"Captain"
	end
end
