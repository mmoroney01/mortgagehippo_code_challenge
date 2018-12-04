class Coin < ApplicationRecord
  has_many :transactions
  has_many :users, through: :transactions

  def quantity
  	@coins = Coin.where(name: self.name, value: self.value)

  	@coins.length
  end

  def quantity_deposited
  	@coins = Coin.where(name: self.name, value: self.value, deposited?: true)

  	@coins.length
  end

  def self.total_value
  	@coins = Coin.all

    @total = 0

    @coins.each do |coin|
      @total += coin.value
    end

    @total
  end
end
