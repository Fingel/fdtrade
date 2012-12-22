class StaticPagesController < ApplicationController
require 'will_paginate/array' 

  def home
	if signed_in?
		if bat = params[:battalion]
			@feed_items = current_user.battalion_feed(bat).paginate(page: params[:page], per_page:10)
		else
			@feed_items = current_user.feed.paginate(page: params[:page], per_page: 10)		
		end	
	end
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
