class Reunion
  attr_reader   :name,
                :activities

  def initialize(name)
    @name        = name
    @activities  = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.sum do |activity|
      activity.total_cost
    end
  end

  def breakout
    breakdown = Hash.new(0)
    @activities.each do |activity|
      breakup = activity.owed
      breakup.each do |participant|
        breakdown[participant[0]] += participant[1]
      end
    end
    breakdown
  end

  def summary
    look_nice = breakout.map do |key, value|
      "#{key}: #{value}\n"
    end
    look_nice.join
  end
  # Brunch costs $30 & Drinks costs $40
  def detailed_breakout
    the_big_one = Hash.new{|hash, key| hash[key] = []}
    @activities.each do |activity|
      name = breakout.first[0]
      the_big_one[name] << {activity: activity.name,
                            payees: [activity.patty_names[1]],
                            amount: activity.owed.values[0]}
      # require 'pry';binding.pry
    end
    the_big_one
  end
end
