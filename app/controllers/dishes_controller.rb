class DishesController < ApplicationController
before_action :signed_in_user, only: [:new, :create, :destroy, :edit, :update]

  def new
  	@dish = Dish.new
    4.times {@dish.assets.build}
  end

  def create
    @user = User.find(current_user)
  	@dish = current_user.dishes.build(dish_params)
    if @dish.save
      flash[:success] = "Dish Added. YUM!"
      redirect_to current_user
      User.delay.share_dish(current_user.id, dish_url(@dish))
    else
      4.times {@dish.assets.build}
      render 'new'
    end
  end

  def show
    @dish = Dish.find(params[:id])
    @user = @dish.user
    if @dish.present? && @dish.assets.present?
      @photo = @dish.dish_photo
    else
      @photo = root_url + "/images/thumb/missing.png"
    end
  end

  def destroy
    Dish.find(params[:id]).destroy
    redirect_to current_user
  end

  def edit
    @dish_existing = Dish.find(params[:id])
    @dish = Dish.find(params[:id])
    4.times {@dish.assets.build}
  end

  def update
    @dish = Dish.find(params[:id])
    if @dish.update_attributes(dish_params)
      redirect_to edit_dish_path(@dish)
      flash[:success] = "Dish Updated"
    else
      4.times {@dish.assets.build}
      render 'edit'
    end
  end




  private

    def dish_params
      params.require(:dish).permit(:name, :description, :for_sale, assets_attributes: [:id, :photo])
    end
end
