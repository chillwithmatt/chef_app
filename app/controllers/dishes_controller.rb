class DishesController < ApplicationController
  def new
  	@dish = Dish.new
  end

  def create
  	@dish = current_user.dishes.build(dish_params)
    if @dish.save
      flash[:success] = "Dish Added!"
      redirect_to current_user
    else
      render current_user
    end
  end

  def show

  end

  def edit
  end

  private

    def dish_params
      params.require(:dish).permit(:name, :description)
    end
end
