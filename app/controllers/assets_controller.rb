class AssetsController < ApplicationController

	def destroy
		Asset.find(params[:id]).destroy
    	redirect_to current_user
	end
	
end