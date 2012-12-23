class StaticPagesController < ApplicationController
require 'will_paginate/array' 

  def home
	if signed_in?
		@feed_items = current_user.feed.paginate(page: params[:page], per_page: 10)		
	end
  end

  def help
  end
  
  def battalion
	if signed_in?
		@feed_items = current_user.battalion_feed.paginate(page: params[:page], per_page: 10)		
		render 'home'
	else
		redirect_to root_url
	end
  end
  
  def about
  end
  
  def contact
  end
end
