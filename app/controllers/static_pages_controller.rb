class StaticPagesController < ApplicationController
  def home
  	@users = User.all
  	@dishes = Dish.paginate(page: params[:page], per_page: 20)
  end

  def help
  end

  def contact
  end

  def blog
  end
end
