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
    outer_details = Hash.new(0)
    inner_details = Hash.new(0)
    @activities.each do |activity|
      activity.participants.each do |key, value|
        if outer_details.has_key?(key)
          key
        elsif
          outer_details[key] = inner_details #this needs to be all the mini hashes of info
        end
      end
      outer_details
      binding.pry
      #right now I am not making a new hash for every activity
      #which is an issue.
      inner_details[:activity] = activity.name
      breakout.each do |key, value|
        if value.postitive?
          inner_details[:amount] += value
        elsif value.negative?
          inner_details[:payees] = [key]
        end
      end
    end
  end

#the problem is I keep replacing all the
#values with the new values instead of adding
#them in.
#for the payees, i should be able to shovel
#a name in...this more needs to deal with each
#person first and THEN everything about them.
end
