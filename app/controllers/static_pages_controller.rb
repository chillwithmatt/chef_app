class StaticPagesController < ApplicationController
  def home
  	@users = User.all
  	@recent_dishes = Dish.select(:name,:user_id,:created_at).distinct
                  
              
  end

  def help
  end

  def contact
  end

  def about
  end
end
