
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
    @activities.map do |activity|
      activity.total_cost
    end.sum
  end

  def breakout
    hash = Hash.new(0)
    @activities.map do |activity|
      activity.owed.each do |key, value|
        hash[key] += value
      end
    end
    hash
  end

  def summary
    breakout.map do |key, value|
      "#{key}: #{value}\n"
    end.join.chomp
  end
end
