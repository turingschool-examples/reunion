require './lib/activity'
class Reunion
  attr_reader :name,
              :activities
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
    final_breakout = Hash.new(0)
    @activities.each do |activity|
      activity.owed.each do |key, value|
        final_breakout[key] += value
      end
    end
    final_breakout
  end
end
