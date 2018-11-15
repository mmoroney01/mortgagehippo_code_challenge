class CoinsController < ApplicationController
  def create
  	coin = Coin.create(:name => params[:name], :value => params[:value].to_i)

    redirect_to root_path
  end

  def update_one
    @coin = Coin.find_by(:name => params[:name], :value => params[:value].to_i)

    render "coins/update_form"
  end

  def coin_updated
    @coin = Coin.find(params[:id])

    @coin.update(name: params[:name], value: params[:value])

    redirect_to root_path
  end

  def delete_one
    @coin = Coin.find_by(:name => params[:name], :value => params[:value].to_i)

    @coin.delete

    redirect_to root_path
  end

  def see_all
  	@coins = Coin.all

  	render "coins/index"
  end

  def see_one
    @coin = Coin.find_by(:name => params[:name], :value => params[:value].to_i)

    render "coins/show"
  end

  def total_value
    @coins = Coin.all

    @total = 0

    @coins.each do |coin|
      @total += coin.value
    end

    render 'coins/total_value'
  end
end
