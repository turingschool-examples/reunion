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
    @activities.sum { |activity| activity.total_cost }
  end

  def individual_breakout(participant)
    @activities.sum { |activity| activity.owed[participant] ||= 0 }
  end

  def all_participants
    @activities.map { |activity| activity.participants.keys }.flatten.uniq
  end

  def breakout
    all_participants.reduce({}) do |accumulator, participant|
      accumulator[participant] = individual_breakout(participant)
      accumulator
    end
  end

  def summary
    all_participants.reduce("") do |string, participant|
      string + "#{participant}: #{individual_breakout(participant)}\n"
    end.chomp
  end
end
