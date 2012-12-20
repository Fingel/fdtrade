require 'spec_helper'

describe "User pages" do
  subject { page }
	describe "signup page" do
		before { visit signup_path }
		it { should have_selector('h1') }
		it { should have_selector('title') }
	end
  
	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }
		
		it { should have_selector('h1', text: user.first + " " + user.last) }
		it { should have_selector('title', text: user.first + " " + user.last) }
	end
	
	describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "user_first",        with: "Example"
        fill_in "user_last",         with: "Spec"
        fill_in "Email",        with: "user@example.com"
        fill_in "Ident",		with: "ab1234"
        fill_in "Phone",		with: "1234567890"
        fill_in "Password",     with: "foobar"
        fill_in "user_password_confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email('user@example.com') }

        it { should have_selector('title', text: user.first + ' ' + user.last) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
		it { should have_link('Sign out') }
      end
    end
  end
  
end
