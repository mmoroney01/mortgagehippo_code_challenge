class TransactionsController < ApplicationController
  before_action :authenticate_user

  def index
  	@transactions = Transaction.all
    
  	render json: @transactions
  end

  def create
    @coin = Coin.find(params[:transaction][:coin_id])
    @transaction = Transaction.new(transaction_params)

    if @transaction.deposit == true
      if @coin.deposited? == false
        if @transaction.save
          @coin.update(deposited?: true)
          render json: { msg: "your coin has been deposited" }          
        end
      else
        render json: { msg: "your coin is already deposited" }
      end
    else
      if @coin.deposited? == true
        if @transaction.save
          if @coin.quantity_deposited <= 4

            @admins = User.where("role = ?", "admin")

            @coin_total = Coin.total_value

            AdminMailer.four_coins_or_less(@admins, @coin, @coin_total).deliver

            @coin.update(deposited?: false)
          end
          render json: { msg: "your coin has been withdrawn" }          
        end
      else
        render json: { msg: "your coin is not deposited" }
      end
    end
  end

  private
  
  def transaction_params
    params.require(:transaction).permit(:coin_id, :deposit, :withdrawal, :user_id)
  end
end