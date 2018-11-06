require 'pry'
require './lib/activity'

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
    sum = 0
    @activities.each do |activity|
      sum += activity.participants.values.sum
    end
    sum
  end

  def breakout
    final_name_and_owed = @activities.map do |activity|
      activity.owed
    end
    breakout_tally = Hash.new(0)
    final_name_and_owed.each do |final|
      final.each do |key, value|
        if key == key
          breakout_tally[key] += value
        end
      end
    end
    breakout_tally

  end

  def summary
    pretty_print = breakout.map do |key, value|
      "#{key}: #{value}"
    end
    pretty_print.join("\n")
  end

end
