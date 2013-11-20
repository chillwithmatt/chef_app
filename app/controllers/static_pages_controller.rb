class StaticPagesController < ApplicationController
  def home
  	@users = User.all
  	@recent_dishes = Dish.all
  end

  def help
  end

  def contact
  end

  def blog
  end
end
