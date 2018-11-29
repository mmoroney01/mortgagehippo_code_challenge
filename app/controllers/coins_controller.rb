class CoinsController < ApplicationController
  before_action :authenticate_user
  
  def index
    @coins = Coin.all
    if @coins
      render json: @coins
    else
      render json: { msg: "There are no coins."}
    end
  end

  def create
  	@coin = Coin.create(:name => params[:name], :value => params[:value].to_i)

    if @coin
      render json: @coin
    else
      render json: { msg: "This coin could not be created."}
    end
  end

  def show
    @coin = Coin.find_by(:name => params[:name], :value => params[:value].to_i)

    if @coin
      render json: @coin
    else
      render json: { msg: "This coin does not exist."}
    end
  end

  def update
    @coin = Coin.find_by(:name => params[:old_name], :value => params[:old_value].to_i)

    if @coin
      @coin.update(:name => params[:new_name], :value => params[:new_value].to_i)
      render json: { msg: "Coin updated."}
    else
      render json: { msg: "This coin does not exist."}
    end
  end

  def delete
    @coin = Coin.find_by(:name => params[:name], :value => params[:value].to_i)

    if @coin
      @coin.delete
      render json: { msg: 'Coin deleted.' }
    else
      render json: { msg: 'This coin does not exist.'}
    end
  end

  def total_value
    @coins = Coin.all

    @total = 0

    @coins.each do |coin|
      @total += coin.value
    end

    render json: @total
  end
end
