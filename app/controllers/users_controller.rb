class UsersController < ApplicationController

  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def comrades
    @comrades = current_user.comrades
  end

end
