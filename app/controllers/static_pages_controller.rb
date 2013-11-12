class StaticPagesController < ApplicationController
  def home
  	@users = User.all
  	@recent_dishes = Dish.find_by_sql('SELECT dishes.name, max(dishes.created_at) as created_at, dishes.user_id
  										FROM dishes
  										LEFT JOIN users ON dishes.user_id = users.id
  										GROUP BY user_id')
  end

  def help
  end

  def contact
  end

  def about
  end
end
