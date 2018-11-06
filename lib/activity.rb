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
    @participants.map do |key, value|
      amount_owed = (value - split)
      new_charge[key] = amount_owed
    end
    owed_value = {}
    new_charge.each do |key, value|
      amount_to_pay = value * -1
      owed_value[key] = amount_to_pay
    end
    owed_value
  end
  # this is not a good method. but it passes

end
