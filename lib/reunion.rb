require 'pry'
class Reunion
  attr_reader :name, :activities, :detailed_hash
  def initialize(name)
    @name = name
    @activities = []
    @detailed_hash = {:activity => "", :payees => [], :amount => 0}
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

  def summary
    printed = breakout.map do |name, owed|
      "#{name.to_sym}: #{owed}\n"
    end
    printed.join.chomp
  end

  def activity_breakout(activity)
    activity.owed.select do |name, owed|
      if owed.negative?
      @detailed_hash[:activity] = activity.name
      @detailed_hash[:payees] << name
      @detailed_hash[:amount] =+ owed.abs
      end
     end
     detailed_hash
  end

  def mini_breakout
    @activities.each do |activity|
      activity_breakout(activity)
    end
    detailed_hash
  end

  def detailed_breakout
    hash = {}
    @activities.each do |activity|
      activity.owed.select do |name, owed|
      if owed.negative? == false
        hash[name] = [mini_breakout]
      end
    end
    end
    hash
  end


end
