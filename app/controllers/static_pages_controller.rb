class StaticPagesController < ApplicationController
  def home
  	@users = User.all
  	@recent_dishes = Dish.all(:select => "name, created_at, user_id, count(*)", :group => "user_id")
  end

  def help
  end

  def contact
  end

  def about
  end
end
