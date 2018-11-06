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

  def detailed_breakout
    outer_details = {}
    inner_details = Hash.new(0)
    @activities.each do |activity|
      inner_details[:activity] = activity.name
      breakout.each do |key, value|
        if value.negative?
          inner_details[:payees] = [key]
        elsif value.positive?
          inner_details[:amount] += value
          outer_details[key] = [inner_details]
        end
      end
    end
    outer_details
  end
end
