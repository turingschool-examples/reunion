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
      (activity.total_cost)
    end.sum
  end

  def breakout
    require 'pry';binding.pry
    hash_array =
    @activities.map do |activity|
      activity.owed
    end
    hash_array.inject({}) do |sum, activity_total|
      sum.merge(activity_total)
    end
  end
end
