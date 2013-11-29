class AssetsController < ApplicationController
	
	def destroy
		@dish = Asset.find(params[:id]).dish
		Asset.find(params[:id]).destroy
    	redirect_to edit_dish_path(@dish)
	end
	
end