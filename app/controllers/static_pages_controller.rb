class StaticPagesController < ApplicationController
  def buy
  	@users = User.all
  	@dishes = Dish.paginate(page: params[:page], per_page: 10)
  end

  def sell
    @users = User.all
    @dishes = Dish.paginate(page: params[:page], per_page: 10)
  end

  def help
  end

  def contact
  end

  def blog
  end
end
