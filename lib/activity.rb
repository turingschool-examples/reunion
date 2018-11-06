require 'pry'
class Activity
  attr_reader :name, :participants
  def initialize(name)
    @name = name
    @participants = Hash.new
  end

  def add_participant(name, cost)
    @participants[name] = cost
  end

  def total_cost
    @participants.values.sum
  end

  def split
    total_cost / @participants.count
  end

  def owed
    owed = Hash.new
    @participants.map do |person, cost|
      tally = split - cost
      owed[person] = tally
    end
    owed
  end

  

end
