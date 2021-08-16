class StocksController < ApplicationController


  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        render 'users/my_portfolio'
      else
        flash[:alert] = "Symbol not found: #{params[:stock]}"
        redirect_to my_portfolio_path
      end
    else
      flash[:alert] = "Symbol can't be empty string"
      redirect_to my_portfolio_path
    end

  end


end
