class StaticPagesController < ApplicationController
require 'will_paginate/array' 

  def home
	if signed_in?
		
		if params[:battalion] == 'true'
			@feed_items = current_user.battalion_feed.paginate(page: params[:page], per_page: 10)
		else
			@feed_items = current_user.feed.paginate(page: params[:page], per_page: 10)
		end
	else
		render 'home'
	end
	
  end
  
  def calendar
	if signed_in?
		@date = params[:month] ? Date.strptime(params[:month], "%Y-%m") : Date.today
		if params[:battalion] == 'true'
			@feed_items = current_user.battalion_feed
		else
			@feed_items = current_user.feed
		end
		render 'home'
	else
		redirect_to root_url
	end
	
  end
  
  def help
  end
  
  def about
  end
  
  def contact
  end
end
