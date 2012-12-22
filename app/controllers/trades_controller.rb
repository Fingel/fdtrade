class TradesController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]
  def create
	@trade = current_user.trades.build(params[:trade])
	if @trade.save
		flash[:success] = "Trade created!"
		redirect_to user_path(current_user)
	else
		flash[:error] = "Trade not saved. Please check for a valid date format (yyyy-mm-dd) an an option time in 24 hour format (hh:mm)"
		redirect_to user_path(current_user)
	end
  end

  def destroy
  end

  def index
  end
end
