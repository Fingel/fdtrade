namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
	
		Department.create!(name: "San Francisco Fire Department",
							city: "San Francisco",
							state: "CA")
							
		House.create!(name:	"Station 2",
						number: 2,
						address: "423 Union St",
						address2:	"nowhere",
						phone:	1234567890,
						department_id: 1,
						battalion:	10)
						
		admin = User.create!(first: "Fake",
					last:		"User",
					ident:		"ab1234",
					phone:		"1234567890",
					house_id:	1,
					email:		"austin.riba@gmail.com",
					rank:		"Peon",
					password:	"welcome123",
					password_confirmation: "welcome123")
		admin.toggle!(:admin)
					
		99.times do |n|
			first 	= Faker::Name.first_name
			last	= Faker::Name.last_name
			phone	= Faker::PhoneNumber.phone_number
			email	= "example-#{n+1}@railstutorial.org"
			password	= "password" 
			User.create(first:	first,
						last:	last,
						email:	email,
						phone: 	phone,
						house_id: 	1,
						rank:	"peon",
						ident:	"ab1234",
						password:	password,
						password_confirmation:	password)
			end
		end
	end
			
