class DishesController < ApplicationController
  def new
  	@dish = Dish.new
    5.times {@dish.assets.build}
  end

  def create
    @user = User.find(current_user)
  	@dish = current_user.dishes.build(dish_params)
    if @dish.save
      flash[:success] = "Dish Added. YUM!"
      redirect_to current_user
      User.delay.share_dish(current_user.id, user_url(@user) + "?" + CGI::escape(@dish.name) )
    else
      5.times {@dish.assets.build}
      render 'new'
    end
  end

  def show
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
      redirect_to current_user
    else
      redirect_to current_user
    end
  end




  private

    def dish_params
      params.require(:dish).permit(:name, :description, :for_sale, assets_attributes: [:id, :photo])
    end
end
