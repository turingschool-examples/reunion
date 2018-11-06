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
    total_cost = 0
    @activities.each do |activity|
      total_cost += activity.total_cost
    end
    total_cost
  end

  def breakout
    breakout_hash = Hash.new(0)
    @activities.each do |activity|
      activity.owed.each do |key, value|
        breakout_hash[key] += value
      end
    end
    breakout_hash
  end

  def summary
    summary_string = ""
    breakout.each do |key, value|
      summary_string << "#{key}: #{value}\n"
    end
    summary_string.chomp
  end

#Made the participant_names method so I can use it as the
#key for the detailed_breakout hash
#(THIS IS WORKING. I ADDED A TEST FOR IT)
  def participant_names
    names = @activities.map do |activity|
      activity.participants.keys
    end
    names.flatten.uniq
  end

#Want this method to give me a list of all the
#activities a given person participated in
#want to use this to try and get part of my
#value for my detailed_breakout hash
#(THIS IS NOT WORKING YET)
  def activities_per_participant
    activities_per_participant_hash = Hash.new(0)
    @activities.each do |activity|
      activities_per_participant_hash[activity.name] = activity.participants.keys
      # participants.each do |activity, key|
      #   activities_per_participant_hash[key] = activity
      #   end
    end
    binding.pry
    activities_per_participant_hash
  end

#I want to assemble the parts of my detailed_breakout
#hash here. (THIS IS CURRENTLY PSUEDOCODE SINCE ITS NOT WORKING)
  def detailed_breakout
    detailed_breakout_hash = Hash.new(0)
    activities_per_participant.each do |activities|
       detailed_breakout_hash[participant_names] = activities
    end
    detailed_breakout_hash
  end
end
