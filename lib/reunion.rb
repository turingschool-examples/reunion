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
    activities.reduce(0) do |total, activity|
      total += activity.total_cost
    end
  end

  def breakout
    activities.reduce(Hash.new(0)) do |breakout, activity|
      activity.owed.each do |participant, owed|
        breakout[participant] += owed
      end
      breakout
    end
  end

  def summary
    breakout.map.with_index do |(participant, owed), index|
      summary = "#{participant}: #{owed}"
      summary += "\n" unless index == breakout.length - 1
      summary
    end.join
  end

  def detailed_breakdown
    activities.reduce(initial_participants) do |breakdown, activity|
      bill = activity.owed

      bill.each do |participant, owed|
        current_is_owed = owed < 0
        payees = bill.find_all do |person, amount|
          (amount < 0) != current_is_owed
        end.to_h.keys
        activity_breakdown_for_current = {
          activity: activity.name,
          payees: payees,
          amount: owed / payees.length
        }
        breakdown[participant] << activity_breakdown_for_current
      end
      breakdown
    end
  end

  def initial_participants
    names = activities.map do |activity|
      activity.participants.keys
    end.flatten.uniq

    names.reduce({}) do |participants, name|
      participants[name] = []
      participants
    end
  end
end
