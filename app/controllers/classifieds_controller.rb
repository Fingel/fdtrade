class ClassifiedsController < ApplicationController
before_filter :signed_in_user
before_filter :correct_user, only: [:edit, :destroy]
	def new
		@classified = Classified.new
	end
	
	def show
		@classified = Classified.find(params[:id])
	end
	
	def create
		@classified = current_user.classifieds.build(params[:classified])
		if @classified.save
			flash[:success] = "Classified posted succesfully"
			redirect_to @classified
		else
			flash[:error] = "There was an error with your posting"
			render action 'new'
		end
	end
	
	def index
		@classifieds = Classified.all
	end
	
	def destroy
		@classified = Classified.find(params[:id])
		@classified.destroy
		flash[:success] = "Classified successfully deleted"
		redirect_to classifieds_url
	end
	
	def edit
		@classified = Classified.find(params[:id])
	end
	
	def update
		@classified = Classified.find(params[:id])
		if @classified.update_attributes(params[:classified])
			flash[:success] = "Classified successfully updated"
			redirect_to @classified
		else
			flash[:error] = "Error saving classified"
			render 'edit'
		end
	end
	private
	def correct_user
		@classified = current_user.classifieds.find_by_id(params[:id])
		redirect_to root_url if @classified.nil?
	end
end
