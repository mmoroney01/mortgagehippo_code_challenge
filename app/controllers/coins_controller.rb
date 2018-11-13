class CoinsController < ApplicationController
  def create
  	coin = Coin.create(:name => params[:name], :value => params[:value].to_i)

  	render "index/index"
  end
end
