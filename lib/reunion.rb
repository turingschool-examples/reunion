require 'pry'

class Reunion
  attr_reader :name, :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    total = 0
    @activities.each do |activity|
      total += activity.participants.values.sum
    end
    return total
  end

  def breakout
    breakout_hash = Hash.new(0)
    @activities.each do |activity|
      activity.owed.each do |name, cost|
        breakout_hash[name] += cost
      end
    end
    breakout_hash
  end

  def summary
    sum_array = []
    breakout.each do |name,cost|
      sum_array << "#{name}: #{cost}"
    end
    sum_array.join("\n")
  end

end
