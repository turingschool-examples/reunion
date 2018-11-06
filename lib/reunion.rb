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

  def per_person_info
    @activities
    #this has something to do with breakout
    #except for each activity, not all together
    #I'm making this too complicated

    binding.pry
      # inner_details[:activity] = activity.name
      #   inner_details[:amount] += value
      #   inner_details[:payees] = [key]

  end

  def detailed_breakout
    outer_details = Hash.new(0)
    @activities.each do |activity|
      activity.participants.each do |key, value|
        if outer_details.has_key?(key)
          key
        elsif
          outer_details[key] = inner_details #this needs to be all the mini hashes of info
          #so i'm going to try and make a helper method that does this
        end
      end
      outer_details
    end
  end

end
