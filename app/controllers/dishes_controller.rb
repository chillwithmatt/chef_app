class DishesController < ApplicationController
  def new
  	@dish = Dish.new
    5.times {@dish.assets.build}
  end

  def create
  	@dish = current_user.dishes.build(dish_params)
    if @dish.save
      flash[:success] = "YOU DID IT! MORE?"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def destroy
    Dish.find(params[:id]).destroy
    redirect_to current_user
  end

  def edit
    @dish = Dish.find(params[:id])
    5.times {@dish.assets.build}
  end

  def update
    @dish = Dish.find(params[:id])
    if @dish.update_attributes(dish_params)
      flash[:success] = "Photo Added"
      redirect_to current_user
    else
      redirect_to root_url
    end
  end




  private

    def dish_params
      params.require(:dish).permit(:name, :description, assets_attributes: [:id, :photo])
    end
end
