class CoinsController < ApplicationController
  def create
  	coin = Coin.create(:name => params[:name], :value => params[:value].to_i)

  	respond_to do |f|
      f.html { redirect_to root_path }
      f.js
    end
  end

  def see_all
  	@coins = Coin.all

  	render "coins/index"
  end
end
