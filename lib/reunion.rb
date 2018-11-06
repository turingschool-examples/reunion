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
    cost = @activities.map do |activity|
      activity.total_cost
    end
    cost.sum
  end

  def breakout_for_each_activity
    @activities.map do |activity|
      activity.owed
    end
  end

  def breakout
    breakout_hash = Hash.new(0)
    breakout_for_each_activity.each do |activity|
      activity.each do |name, amount_owed|
      breakout_hash[name] += amount_owed
    end
  end
      breakout_hash
  end



end
