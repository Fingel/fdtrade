require 'spec_helper'

describe Trade do
	let(:user) { FactoryGirl.create(:user) }
	before {
		@trade = user.trades.build(date: DateTime.now+1, 
		flipflop: true, worktrade: false)
	}
	
	subject { @trade }
	
	it { should respond_to(:date) }
	it { should respond_to(:flipflop) }
	it { should respond_to(:worktrade) }
	it { should respond_to(:user_id) }
	
	it { should be_valid }
	
	describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Trade.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "when user_id is not present" do
    before { @trade.user_id = nil }
    it { should_not be_valid }
  end
end
	

