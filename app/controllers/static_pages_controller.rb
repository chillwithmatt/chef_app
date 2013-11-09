class StaticPagesController < ApplicationController
  def home
  	@users = User.all
  end

  def help
  end

  def contact
  end

  def about
  end
end
