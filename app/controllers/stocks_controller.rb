class StocksController < ApplicationController


  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        # the respond to block of code, handles the AJAX requests
        respond_to do |format|
          # the partial expects a _stock_data.js.erb file under the views/users folder
          format.js { render partial: 'users/stock_data'}
        end
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
