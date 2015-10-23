require_relative "station.rb"

class Oystercard

  attr_reader :balance, :entry_station, :exit_station

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station = nil
    @exit_station = nil

  end

  def top_up(amount)
    raise StandardError, "Cannot exceed #{MAX_BALANCE} pounds" if (balance + amount) > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise StandardError, 'Insufficient funds' if (balance) < MIN_BALANCE
    @entry_station = station
    @in_journey = true
  end

  def in_journey?
    !!entry_station
  end

  def touch_out(station)
    raise StandardError, 'Error: card not touched in' if @in_journey == false
    @in_journey = false
    @entry_station = nil
    deduct(MIN_FARE)
    @exit_station = station
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end