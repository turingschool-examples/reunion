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
    @activities.sum do |activity|
      activity.total_cost
    end
  end

  def breakout
    breakout_hash = Hash.new(0)
    @activities.each do |activity|
      activity.owed.map do |person, amount|
        breakout_hash[person] += amount
      end
    end
    breakout_hash
  end

  def summary
    breakout.map do |person, amount|
      p "#{person}: #{amount}"
    end.join("\n")
  end

end

# def total_cost
#   cost_array = @activities.map do |activity|
#      activity.total_cost
#   end
#   cost_array.sum
# endg
