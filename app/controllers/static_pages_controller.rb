class StaticPagesController < ApplicationController
  def home
  	@users = User.all
  	@recent_dishes = Dish.all(:group => "user_id")
  end

  def help
  end

  def contact
  end

  def about
  end
end
