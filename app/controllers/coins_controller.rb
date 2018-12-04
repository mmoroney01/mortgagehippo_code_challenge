class CoinsController < ApplicationController
  before_action :authenticate_user
  before_action :find_coin, only: [:show, :update, :destroy]
  
  def index
    @coins = Coin.all

    render json: @coins
  end

  def create
    @coin = Coin.new(coin_params)

    if @coin.save
      render json: @coin
    else
      render json: { msg: "This coin could not be created."}
    end
  end

  def show
    render json: @coin
  end

  def update
    if @coin.update(coin_params)
      render json: { msg: "Coin updated."}
    else
      render json: { msg: "This coin does not exist."}
    end
  end

  def destroy
    if @coin.destroy
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

  private

  def find_coin
    @coin = Coin.find(params[:id])
  end

  def coin_params
    params.require(:coin).permit(:value, :name)
  end
end

