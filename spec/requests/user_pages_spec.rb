require 'spec_helper'

describe "User pages" do
  subject { page }
  describe "signup page" do
	before { visit signup_path }
    it { should_have_selector('h1',	text:'Sign up')}
    it { should_have_selector('title', 	text: full_title('Sign Up'))}
  end
end
