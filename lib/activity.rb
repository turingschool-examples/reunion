require 'pry'

class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = Hash.new(0)
  end

  def add_participant(participant, cost)
    @participants[participant] += cost
  end

  def total_cost
    @participants.values.sum
  end

  def split
    total_cost / @participants.count
  end

  def owed
    new_charge = {}
    @participants.each do |key, value|
      amount_owed = (split - value)
      new_charge[key] = amount_owed
    end
    new_charge
  end

end
