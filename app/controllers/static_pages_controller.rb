class StaticPagesController < ApplicationController
  def home
  	@users = User.all
  	@recent_dishes = Dish.all(:select => "name, max(created_at) as created_at, user_id", :group => "user_id")
  end

  def help
  end

  def contact
  end

  def about
  end
end
