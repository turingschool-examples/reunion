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

  def attended_activities(participant)
    @activities.select do |activity|
      activity.participants.keys.include?(participant)
    end
  end

  def ind_detailed_breakout(participant)
    { participant => breakout_block(participant) }
  end

  def breakout_block(participant)
    attended_activities(participant).map do |activity|
      { activity: activity.name,
        payees: activity.payees_for(participant),
        amount: activity.amount_owed_per_payee(participant)
      }
    end
  end

  def detailed_breakout
    all_participants.reduce({}) do |hash, participant|
      hash.merge(ind_detailed_breakout(participant))
    end
  end
end
