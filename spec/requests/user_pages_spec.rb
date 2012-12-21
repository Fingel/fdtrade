require 'spec_helper'

describe "User pages" do
  subject { page }
  
	describe "index" do
	
	let(:user) { FactoryGirl.create(:user) }
    
    before do
      sign_in user
      visit users_path
    end

    it { should have_selector('title', text: 'All users') }
    it { should have_selector('h1',    text: 'All users') }
    
    describe "pagination" do
	  before(:all) { 30.times { FactoryGirl.create(:user) } }
	  after(:all) { User.delete_all }
	  
	  it { should have_selector('div.pagination') }

    it "should list each user" do
      User.paginate(page: 1) do |user|
        page.should have_selector('li', text: full_name(user))
       end
     end
    end
    describe "delete links" do

      it { should_not have_link('delete') }

      describe "as an admin user" do
        let(:admin) { FactoryGirl.create(:admin) }
        before do
          sign_in admin
          visit users_path
        end

        it { should have_link('delete', href: user_path(User.first)) }
        it "should be able to delete another user" do
          expect { click_link('delete') }.to change(User, :count).by(-1)
        end
        it { should_not have_link('delete', href: user_path(admin)) }
      end
     end
	end
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
        fill_in "user_rank",	with: "Corporal"
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
  
  describe "edit" do
	let(:user) { FactoryGirl.create(:user)}
	before do
		sign_in user
		visit edit_user_path(user)
	end
	before { visit edit_user_path(user) }

    describe "page" do
      it { should have_selector('h1',    text: "Update your profile") }
      it { should have_selector('title', text: "Edit user") }
      it { should have_link('Change this image', href: 'http://gravatar.com/emails') }
    end

    describe "with invalid information" do
      before { click_button "Save Changes" }

      it { should have_content('error') }
    end
    
    describe "with valid information" do
      let(:new_first)  { "New First" }
      let(:new_last)	{ "New Last"}
      let(:new_email) { "new@example.com" }
      before do
        fill_in "user_first",       with: new_first
        fill_in "user_last",		with: new_last
        fill_in "Email",            with: new_email
        fill_in "Password",         with: user.password
        fill_in "user_password_confirmation", with: user.password
        click_button "Save Changes"
      end

      it { should have_selector('title', text: new_first + " " + new_last) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { user.reload.first.should  == new_first }
      specify { user.reload.last.should == new_last}
      specify { user.reload.email.should == new_email }
    end
  end
end
