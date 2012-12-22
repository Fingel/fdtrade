class TradesController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]
  def create
	@trade = current_user.trades.build(params[:trade])
	if @trade.save
		flash[:success] = "Trade created!"
		redirect_to user_path(current_user)
	else
		flash[:error] = "Trade not saved."
		redirect_to user_path(current_user)
  end

  def destroy
  end

  def index
  end
end
