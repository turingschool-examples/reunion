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
    reunion_cost = @activities.sum do |activity|
      activity.total_cost
    end
    reunion_cost
  end

  # def breakout
  #   total_owed = Hash.new { |hash, key| hash[key] = 0 }
  #   @activities.each do |activity|
  #     require "pry"; binding.pry
  #     activity.owed
  #   end
  #   total_owed
  # end

  def participant_count
    total_participants = []
    @activities.sort_by do |activity|
      total_participants << activity.participants.keys
    end
    total_participants.flatten.uniq.count
  end

  def cost_per_participant
    total_cost / participant_count
  end

  def breakout
    breakout_hash = Hash.new { |hash, key| hash[key] = 0 }
    @activities.each do |activity|
      activity.participants.each do |participant, cost|
        breakout_hash[participant] += activity.split - cost
      end
    end
    breakout_hash
  end

  def summary
    breakout_summary = []
    breakout.each do |name, cost|
      breakout_summary << name + ": " + "#{cost}\n"
    end
    breakout_summary.join.chomp
  end
end
