require 'spec_helper'

describe "StaticPages" do
  describe "Home Page" do
    it "Should have the content 'fdTrades'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit root_path
      page.should have_content('fdTrades')
    end
  end
  
  describe "About page" do

    it "should have the content 'About Us'" do
      visit about_path
      page.should have_content('About Us')
    end
  end
  
  describe "Contact page" do
	it "should have the h1 'Contact'" do
		visit contact_path
		page.should have_selector('h1')
	end
  end
end
