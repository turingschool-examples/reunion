require 'pry'

class Activity

  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
    @total_cost = 0
  end

  def add_participant(name, fee)
    @participants[name] = fee
  end

  def total_cost
    @participants.values.sum
  end



end
