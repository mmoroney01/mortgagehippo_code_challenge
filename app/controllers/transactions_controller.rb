class TransactionsController < ApplicationController
  # before_action :authenticate_user

  def index
  	@transactions = Transaction.all
    
  	render json: @transactions
  end

  def create
    @coin = Coin.find(params[:transaction][:coin_id])

    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      @coin.update(deposited?: true) if @transaction.deposit == true
      @coin.update(deposited?: false) if @transaction.withdrawal == true

      render json: { msg: "your coin has been deposited" } if @transaction.deposit == true
      render json: { msg: "your coin has been withdrawn" } if @transaction.withdrawal == true
    else
      render json: { msg: "your coin could not be deposited" }
    end
  end

  private
  
  def transaction_params
    params.require(:transaction).permit(:coin_id, :deposit, :withdrawal, :user_id)
  end
end

# {
#   "transaction": {
#     "coin_id": 2,
#     "user_id": 1,
#     "deposit": true,
#     "withdrawal": false
#   }
# }