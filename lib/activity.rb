require 'pry'
class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = Hash.new(0)
  end

  def add_participant(name, amount_paid)
    @participants[name] = amount_paid
  end

  def total_cost
    @participants.values.sum
  end

  def split
    total_cost / @participants.count
  end

  def owed
    amount_owed = Hash.new(0)
    @participants.each do |key, value|
      amount_owed[key] = split - value
    end
    amount_owed
  end

end
