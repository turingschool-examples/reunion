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

  def summary
    breakout_collection = breakout
    final_summary = []
    breakout_collection.each do |pair|
      final_summary << "#{pair[0]}: #{pair[1]}"
    end
    final_summary.join("\n")
  end
end
